defmodule ShopifyEx.ApiHelper do
  @moduledoc """
  Define API Client and sending request methods.
  """
  @default_timeout 60_000

  @doc """
  Create a new client with shop's endpoint and access token.

  **Parameters**

  - `shop [string]`: The shop name.

  **Options**

  - `access_token [string]`: The OAuth access token.

  **Reference**

  https://shopify.dev/api/admin-rest#authentication
  """
  @spec client(String.t(), keyword()) :: Tesla.Client.t()
  def client(shop, opts \\ []) do
    api_version = ShopifyEx.get_api_version()
    access_token = Keyword.get(opts, :access_token)

    extended_middlewares =
      if not is_nil(access_token) do
        [
          {
            Tesla.Middleware.Headers,
            [
              {"X-Shopify-Access-Token", access_token}
            ]
          }
        ]
      else
        []
      end

    # TODO: Need define the configuration to configure log request, and timeout
    extended_middlewares = [Tesla.Middleware.Logger | extended_middlewares]

    endpoint = create_endpoint(shop)

    endpoint =
      if not is_nil(access_token) do
        "#{endpoint}/admin/api/#{api_version}"
      else
        endpoint
      end

    middlewares =
      [
        {Tesla.Middleware.Timeout, timeout: @default_timeout},
        {Tesla.Middleware.BaseUrl, endpoint},
        Tesla.Middleware.JSON
      ] ++ extended_middlewares

    adapter = {
      Tesla.Adapter.Hackney,
      recv_timeout: @default_timeout, connect_timeout: @default_timeout
    }

    Tesla.client(middlewares, adapter)
  end

  @spec create_endpoint(String.t()) :: String.t()
  def create_endpoint(shop), do: "https://#{shop}.myshopify.com"

  @doc """
  Perform a GET request

      get("/users")
      get("/users", query: [scope: "admin"])
      get(client, "/users")
      get(client, "/users", query: [scope: "admin"])
      get(client, "/users", body: %{name: "Jon"})
  """
  @spec get(Tesla.Client.t(), String.t(), keyword()) :: {:ok, any()} | {:error, any()}
  def get(client, path, opts \\ []) do
    Tesla.get(client, path, [{:opts, [api_name: path]} | opts])
  end

  @doc """
  Perform a POST request

      post("/users", %{name: "Jon"})
      post("/users", %{name: "Jon"}, query: [scope: "admin"])
      post(client, "/users", %{name: "Jon"})
      post(client, "/users", %{name: "Jon"}, query: [scope: "admin"])
  """
  @spec post(Tesla.Client.t(), String.t(), map(), keyword()) :: {:ok, any()} | {:error, any()}
  def post(client, path, body, opts \\ []) do
    Tesla.post(client, path, body, [{:opts, [api_name: path]} | opts])
  end
end
