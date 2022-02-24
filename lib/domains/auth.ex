defmodule ShopifyEx.Auth do
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

      endpoint = ShopifyEx.ApiHelper.create_endpoint(shop)

      {:ok, "#{endpoint}/admin/oauth/authorize?#{query_params}"}
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

  @doc """
  Request Shopify to take access token

  **Parameters**

    - `shop [string]`: The Shopify shop name.
    - `api_key [string]`: The API key for the app.
    - `api_secret_key [string]`: The secret API key for the app.
    - `code [string]`: The authorization code.

  **Example**

  ```
  iex> Auth.request_token(shop, api_key, api_secret_key, code)
    {:ok, "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"}
  ```

  **Reference**

    https://shopify.dev/apps/auth/oauth/getting-started#step-5-get-a-permanent-access-token
  """
  @spec request_token(String.t(), String.t(), String.t(), String.t()) ::
          {:ok, String.t()} | {:error, String.t()}
  defdelegate request_token(shop, api_key, api_secret_key, code),
    to: ShopifyEx.Auth.RequestTokenAction,
    as: :perform
end
