defmodule ShopifyEx.Product.ListProductsAction do
  @moduledoc """
  Handle listing products action
  """
  alias ShopifyEx.Client

  @schema %{
    created_at_max: :utc_datetime,
    created_at_min: :utc_datetime,
    limit: [type: :integer, number: [min: 1, max: 250]],
    product_type: :string,
    published_at_max: :utc_datetime,
    published_at_min: :utc_datetime,
    published_status: [type: :string, in: ShopifyEx.Product.ProductPublishedStatus.enum()],
    since_id: :integer,
    status: [type: :string, in: ShopifyEx.Product.ProductStatus.enum()],
    updated_at_max: :utc_datetime,
    updated_at_min: :utc_datetime,
    vendor: :string
  }

  def perform(session, params \\ %{}) do
    with {:ok, request_params} <- Tarams.cast(params, @schema),
         request_params <- ShopifyEx.MapHelper.clean_nil(request_params),
         {:ok, data} <- execute_request(session, request_params) do
      {:ok, data}
    end
  end

  defp execute_request(session, params) do
    api_version = ShopifyEx.get_api_version()

    params = ShopifyEx.MapHelper.to_get_request_query(params)

    Client.new(session)
    |> Client.get("/admin/api/#{api_version}/products.json", query: params)
    |> case do
      {:ok, %{status: 200, body: body}} ->
        {:ok, body}

      {:ok, %{body: body}} ->
        {:error, body}

      _error ->
        {:error, "Something went wrong"}
    end
  end
end
