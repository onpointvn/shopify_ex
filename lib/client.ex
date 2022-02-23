defmodule ShopifyEx.Client do
  @moduledoc """
  Define API Client and sending request methods.
  """

  @doc """
  Create a new client with shop's endpoint and access token.

  **Options**

    - `timeout [integer]`: The timeout for all requests that use the generated client. Default: 60 seconds.
    - `log_request [boolean]`: Log all information when calling a request.

  **Reference**

    https://shopify.dev/api/admin-rest#authentication
  """

  @spec new(String.t(), String.t() | nil, keyword()) :: Tesla.Client.t()
  def new(shop, access_token, opts \\ []) do
    timeout = Keyword.get(opts, :timeout, 60_000)
    log_request = Keyword.get(opts, :log_request, false)

    extended_middlewares =
      if not is_nil(access_token) do
        [
          {
            Tesla.Middleware.Headers,
            [
              {"X-Shopify-Access-Token", "#{access_token}"}
            ]
          }
        ]
      else
        []
      end

    extended_middlewares =
      if log_request == true do
        [Tesla.Middleware.Logger | extended_middlewares]
      else
        extended_middlewares
      end

    middlewares =
      [
        {Tesla.Middleware.Timeout, timeout: timeout},
        {Tesla.Middleware.BaseUrl, create_endpoint(shop)},
        Tesla.Middleware.JSON
      ] ++ extended_middlewares

    adapter = {
      Tesla.Adapter.Hackney,
      recv_timeout: timeout, connect_timeout: timeout
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
