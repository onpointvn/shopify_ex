defmodule ShopifyEx.Session do
  alias ShopifyEx.Client

  @doc """
  Create an authorization url

  **Parameters**

    - `shop [string]`: The Shopify shop name.
    - `api_key [string]`: The API key for the app.
    - `redirect_uri [string]`: The redirect URI after authorized.

  **Options**

    - `access_scopes [{:array, string}]`: The requested access scopes

  **Reference**

    https://shopify.dev/apps/auth/oauth/getting-started#step-3-ask-for-permission
  """
  @spec create_authorize_url(String.t(), String.t(), String.t(), keyword()) ::
          {:ok, String.t()} | {:error, String.t()}
  def create_authorize_url(shop, api_key, redirect_uri, opts \\ []) do
    access_scopes = Keyword.get(opts, :access_scopes, [])

    with :ok <- validate_access_scopes(access_scopes) do
      access_scopes = Enum.join(access_scopes, ",")
      nonce = UUID.uuid4(:hex)

      query_params =
        [
          {"client_id", api_key},
          {"scope", access_scopes},
          {"redirect_uri", redirect_uri},
          {"state", nonce}
        ]
        |> Enum.map(fn {key, value} -> "#{key}=#{value}" end)
        |> Enum.join("&")

      {:ok, "#{create_shop_url(shop)}/admin/oauth/authorize?#{query_params}"}
    end
  end

  defp validate_access_scopes(access_scopes) do
    Enum.reduce_while(access_scopes, :ok, fn access_scope, acc ->
      if access_scope not in ShopifyEx.AccessScope.enum() do
        {:halt, {:error, "Invalid access scope #{access_scope}"}}
      else
        {:cont, acc}
      end
    end)
  end

  defp create_shop_url(shop), do: "https://#{shop}.myshopify.com"

  @doc """
  Request Shopify to get access token

  **Parameters**

    - `shop [string]`: The Shopify shop name.
    - `api_key [string]`: The API key for the app.
    - `api_secret_key [string]`: The secrect API key for the app.
    - `code [string]`: The authorization code.

  **Options**

    - `timeout [integer]`: The timeout for all requests that use the generated client. Default: 60 seconds.
    - `log_request [boolean]`: Log all information when calling a request.

  **Example**

  ```
  iex> Session.request_token(shop, api_key, api_secret_key, code)
    {
      :ok,
      %{
        "access_token" => "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",
        "scope" => "read_orders,read_fulfillments,read_products"
      }
    }
  ```

  **Reference**

    https://shopify.dev/apps/auth/oauth/getting-started#step-5-get-a-permanent-access-token
  """
  @spec request_token(String.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:error, String.t()}
  def request_token(shop, api_key, api_secret_key, code, opts \\ []) do
    payload = %{
      client_id: api_key,
      client_secret: api_secret_key,
      code: code
    }

    create_shop_url(shop)
    |> Client.new(nil, opts)
    |> Client.post("/admin/oauth/access_token", payload)
    |> case do
      {:ok, %{status: 200, body: body}} ->
        {:ok, body}

      {:ok, %{body: body}} ->
        extract_message(body)
        |> case do
          {:ok, message} ->
            {:error, message}

          _ ->
            {:error, "Request token failed with reason: #{body}"}
        end

      _error ->
        {:error, "Something went wrong"}
    end
  end

  defp extract_message(html) do
    Floki.parse_document(html)
    |> case do
      {:ok, document} ->
        reason =
          document
          |> Floki.find("div.content--block")
          |> Enum.map(fn {_, _, items} -> items end)
          |> Enum.find(fn items ->
            items
            |> Enum.map(fn {_, _, content} -> content end)
            |> Enum.concat()
            |> Enum.find(&(&1 == "What happened?"))
            |> Kernel.is_nil()
            |> Kernel.not()
          end)

        if is_nil(reason) do
          {:error, "Unknown error"}
        else
          message =
            reason
            |> Enum.filter(fn {element, _, _} -> element == "div" end)
            |> Enum.map(fn {_, _, content} -> content end)
            |> Enum.concat()
            |> List.first()
            |> String.trim()

          {:ok, message}
        end

      _ ->
        {:error, "Unknown error"}
    end
  end
end
