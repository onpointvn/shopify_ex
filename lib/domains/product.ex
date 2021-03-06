defmodule ShopifyEx.Product do
  alias Tesla.Client

  @doc """
  Create a product

  **Parameters**

  - `client [Tesla.Client]`: the request client.
  - `params [map]`: the product object parameters.

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/product#[post]/admin/api/2022-01/products.json

  **Example**

  ```
  iex> Product.create_product(client, params)
    {
      :ok,
      %{
        "admin_graphql_api_id" => "gid://shopify/Product/7581313728757",
        "body_html" => nil,
        "created_at" => "2022-02-23T17:49:24+07:00",
        "handle" => "burton-custom-freestyle-155",
        "id" => 7581313728757,
        "image" => nil,
        "images" => [],
        "options" => [
          %{
            "id" => 9661647585525,
            "name" => "Title",
            "position" => 1,
            "product_id" => 7581313728757,
            "values" => ["Default Title"]
          }
        ],
        "product_type" => "",
        "published_at" => "2022-02-23T17:49:24+07:00",
        "published_scope" => "web",
        "status" => "active",
        "tags" => "",
        "template_suffix" => nil,
        "title" => "Burton Custom Freestyle 151",
        "updated_at" => "2022-02-23T17:49:25+07:00",
        "variants" => [
          %{
            "admin_graphql_api_id" => "gid://shopify/ProductVariant/42440628928757",
            "barcode" => nil,
            "compare_at_price" => nil,
            "created_at" => "2022-02-23T17:49:24+07:00",
            "fulfillment_service" => "manual",
            "grams" => 0,
            "id" => 42440628928757,
            "image_id" => nil,
            "inventory_item_id" => 44534886269173,
            "inventory_management" => nil,
            "inventory_policy" => "deny",
            "inventory_quantity" => 0,
            "old_inventory_quantity" => 0,
            "option1" => "Default Title",
            "option2" => nil,
            "option3" => nil,
            "position" => 1,
            "price" => "0",
            "product_id" => 7581313728757,
            "requires_shipping" => true,
            "sku" => "",
            "taxable" => true,
            "title" => "Default Title",
            "updated_at" => "2022-02-23T17:49:24+07:00",
            "weight" => 0.0,
            "weight_unit" => "kg"
          }
        ],
        "vendor" => "Khanh OnPoint"
      }
    }
  ```
  """
  @spec create_product(Client.t(), map()) :: {:ok, map()} | {:error, binary() | map()}
  defdelegate create_product(client, params),
    to: ShopifyEx.Product.CreateProductAction,
    as: :perform

  @doc """
  Retrieve a list of products

  **Parameters**

  - `client [Tesla.Client]`: the request client.
  - `params [map]`: the filter parameters.

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/product#get-products


  **Example**

  ```
  iex> Product.list_products(client, params)
    {
      :ok,
      %{
        products: [
          %{
            "admin_graphql_api_id" => "gid://shopify/Product/7581305176309",
            "body_html" => nil,
            "created_at" => "2022-02-23T17:40:20+07:00",
            "handle" => "burton-custom-freestyle-151",
            "id" => 7581305176309,
            "image" => nil,
            "images" => [],
            "options" => [
              %{
                "id" => 9661636837621,
                "name" => "Title",
                "position" => 1,
                "product_id" => 7581305176309,
                "values" => ["Default Title"]
              }
            ],
            "product_type" => "",
            "published_at" => "2022-02-23T17:40:20+07:00",
            "published_scope" => "web",
            "status" => "active",
            "tags" => "",
            "template_suffix" => nil,
            "title" => "Burton Custom Freestyle 151",
            "updated_at" => "2022-02-23T17:40:20+07:00",
            "variants" => [
              %{
                "admin_graphql_api_id" => "gid://shopify/ProductVariant/42440609530101",
                "barcode" => nil,
                "compare_at_price" => nil,
                "created_at" => "2022-02-23T17:40:20+07:00",
                "fulfillment_service" => "manual",
                "grams" => 0,
                "id" => 42440609530101,
                "image_id" => nil,
                "inventory_item_id" => 44534866870517,
                "inventory_management" => nil,
                "inventory_policy" => "deny",
                "inventory_quantity" => 0,
                "old_inventory_quantity" => 0,
                "option1" => "Default Title",
                "option2" => nil,
                "option3" => nil,
                "position" => 1,
                "price" => "0",
                "product_id" => 7581305176309,
                "requires_shipping" => true,
                "sku" => "",
                "taxable" => true,
                "title" => "Default Title",
                "updated_at" => "2022-02-23T17:40:20+07:00",
                "weight" => 0.0,
                "weight_unit" => "kg"
              }
            ],
            "vendor" => "Khanh OnPoint"
          }
        ],
         page_info: %{
          next: "eyJkaXJlY3Rpb24iOiJuZXh0IiwibGFzdF9pZCI6NDY3MTQ4MzExNzgxMywibGFzdF92YWx1ZSI6IjIwMjItMDMtMDEgMTA6MTA6MzIuMTUxMDg0In0",
          previous: "eyJkaXJlY3Rpb24iOiJwcmV2IiwibGFzdF9pZCI6NDY3MTQ4MzExNzgxMywibGFzdF92YWx1ZSI6IjIwMjItMDMtMDEgMTA6MTA6MzIuMTUxMDg0In0"
        }
      }
    }
  ```
  """
  @spec retrieve_products(Client.t(), map()) ::
          {:ok, %{products: list(map()), page_info: map()}} | {:error, binary() | map()}
  defdelegate retrieve_products(client, params \\ %{}),
    to: ShopifyEx.Product.RetrieveProductsAction,
    as: :perform
end
