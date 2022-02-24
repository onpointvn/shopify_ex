defmodule ShopifyEx.Product.ProductPublishedStatus do
  @moduledoc """
  Product published status enumeration

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/product#get-products
  """
  def any, do: "any"

  def published, do: "published"

  def unpublished, do: "unpublished"

  def enum,
    do: [
      any(),
      published(),
      unpublished()
    ]
end
