defmodule ShopifyEx.Product.ProductPublishedStatus do
  @moduledoc """
  Product published status enumeration

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/product#get-products
  """

  def published, do: "published"

  def unpublished, do: "unpublished"

  def enum,
    do: [
      published(),
      unpublished()
    ]
end
