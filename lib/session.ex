defmodule ShopifyEx.Session do
  @doc """
  Create authorize url

  **Options**
  - `access_scopes [string]`: The requested access scopes

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

      url = "https://#{shop}.myshopify.com/admin/oauth/authorize?#{query_params}"

      {:ok, url}
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

  def request_token() do
  end
end
