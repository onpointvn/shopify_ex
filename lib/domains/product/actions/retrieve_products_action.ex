defmodule ShopifyEx.Product.RetrieveProductsAction do
  @moduledoc """
  Retrieve a list of products

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/product#get-products
  """
  alias ShopifyEx.Constant

  @published_statuses [Constant.any_value() | ShopifyEx.Product.ProductPublishedStatus.enum()]

  @statuses [Constant.any_value() | ShopifyEx.Product.ProductStatus.enum()]

  @schema %{
    created_at_max: :utc_datetime,
    created_at_min: :utc_datetime,
    limit: [type: :integer, number: [min: 1, max: 250]],
    product_type: :string,
    published_at_max: :utc_datetime,
    published_at_min: :utc_datetime,
    published_status: [type: :string, in: @published_statuses],
    since_id: :integer,
    status: [type: :string, in: @statuses],
    updated_at_max: :utc_datetime,
    updated_at_min: :utc_datetime,
    vendor: :string
  }

  def perform(client, params \\ %{}) do
    with {:ok, request_params} <- Tarams.cast(params, @schema) do
      request_params = ShopifyEx.MapHelper.clean_nil(request_params)
      execute_request(client, request_params)
    end
  end

  defp execute_request(client, params) do
    api_version = ShopifyEx.get_api_version()

    params = ShopifyEx.MapHelper.to_get_request_query(params)

    client
    |> ShopifyEx.ApiHelper.get("/admin/api/#{api_version}/products.json", query: params)
    |> case do
      {:ok, %{status: 200, body: %{"products" => products}}} ->
        {:ok, products}

      {:ok, %{body: body}} ->
        {:error, body}

      _error ->
        {:error, "Something went wrong"}
    end
  end
end
