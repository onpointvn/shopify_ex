defmodule ShopifyEx.ProductStatus do
  @moduledoc """
  Product status enumeration

  **Reference**

    https://shopify.dev/api/admin-rest/2022-01/resources/product#resource_object
  """
  # Ready to sell and availalble for customers
  def active, do: "active"

  # No longer being sold
  def archived, do: "archived"

  # Not ready to sell
  def draft, do: "draft"

  def enum, do: [active(), archived(), draft()]
end
