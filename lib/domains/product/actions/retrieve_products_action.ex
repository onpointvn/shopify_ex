defmodule ShopifyEx.Product.RetrieveProductsAction do
  @moduledoc """
  Retrieve a list of products

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/product#get-products
  """
  alias ShopifyEx.Constant
  alias ShopifyEx.MapHelper

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
      request_params =
        request_params
        |> MapHelper.clean_nil()
        |> MapHelper.to_get_request_query()

      client
      |> ShopifyEx.ApiHelper.get("/products.json", query: request_params)
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
end
