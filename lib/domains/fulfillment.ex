defmodule ShopifyEx.Fulfillment do
  alias Tesla.Client

  @doc """
  Cancel a fulfillment

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#post-fulfillments

  **Example**

  ```
  iex> ShopifyEx.Fulfillment.cancel_fulfillment(client, fulfillment_id)

    {
      :ok,
      %{
        "admin_graphql_api_id" => "gid://shopify/Fulfillment/4174825521397",
        "created_at" => "2022-03-01T14:00:09+07:00",
        "id" => 4174825521397,
        "line_items" => [
          %{
            "admin_graphql_api_id" => "gid://shopify/LineItem/11998280679669",
            "discount_allocations" => [],
            "duties" => [],
            "fulfillable_quantity" => 0,
            "fulfillment_service" => "manual",
            "fulfillment_status" => "fulfilled",
            "gift_card" => false,
            "grams" => 0,
            "id" => 11998280679669,
            "name" => "Burton Custom Freestyle 151",
            "origin_location" => %{
              "address1" => "Ho Chi Minh City",
              "address2" => "",
              "city" => "Ho Chi Minh City",
              "country_code" => "VN",
              "id" => 3416911479029,
              "name" => "Ho Chi Minh City",
              "province_code" => "",
              "zip" => "700000"
            },
            "price" => "0",
            "price_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "product_exists" => true,
            "product_id" => 7581311238389,
            "properties" => [],
            "quantity" => 1,
            "requires_shipping" => true,
            "sku" => "",
            "tax_lines" => [
              %{
                "channel_liable" => false,
                "price" => "0",
                "price_set" => %{
                  "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
                  "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
                },
                "rate" => 0.1,
                "title" => "VAT"
              }
            ],
            "taxable" => true,
            "title" => "Burton Custom Freestyle 151",
            "total_discount" => "0",
            "total_discount_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "variant_id" => 42440621785333,
            "variant_inventory_management" => nil,
            "variant_title" => "",
            "vendor" => "Khanh OnPoint"
          },
          %{
            "admin_graphql_api_id" => "gid://shopify/LineItem/11998280712437",
            "discount_allocations" => [],
            "duties" => [],
            "fulfillable_quantity" => 0,
            "fulfillment_service" => "manual",
            "fulfillment_status" => "fulfilled",
            "gift_card" => false,
            "grams" => 0,
            "id" => 11998280712437,
            "name" => "Burton Custom Freestyle 151",
            "origin_location" => %{
              "address1" => "Ho Chi Minh City",
              "address2" => "",
              "city" => "Ho Chi Minh City",
              "country_code" => "VN",
              "id" => 3416911479029,
              "name" => "Ho Chi Minh City",
              "province_code" => "",
              "zip" => "700000"
            },
            "price" => "0",
            "price_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "product_exists" => true,
            "product_id" => 7581313728757,
            "properties" => [],
            "quantity" => 1,
            "requires_shipping" => true,
            "sku" => "",
            "tax_lines" => [
              %{
                "channel_liable" => false,
                "price" => "0",
                "price_set" => %{
                  "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
                  "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
                },
                "rate" => 0.1,
                "title" => "VAT"
              }
            ],
            "taxable" => true,
            "title" => "Burton Custom Freestyle 151",
            "total_discount" => "0",
            "total_discount_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "variant_id" => 42440628928757,
            "variant_inventory_management" => nil,
            "variant_title" => "",
            "vendor" => "Khanh OnPoint"
          }
        ],
        "location_id" => 67749085429,
        "name" => "#1007.1",
        "order_id" => 4671385338101,
        "origin_address" => nil,
        "receipt" => %{},
        "service" => "manual",
        "shipment_status" => nil,
        "status" => "cancelled",
        "tracking_company" => nil,
        "tracking_number" => nil,
        "tracking_numbers" => [],
        "tracking_url" => nil,
        "tracking_urls" => [],
        "updated_at" => "2022-03-01T14:15:14+07:00"
      }
    }
  ```
  """
  @spec cancel_fulfillment(Client.t(), integer()) :: {:ok, map()} | {:error, binary() | map()}
  defdelegate cancel_fulfillment(client, fulfillment_id),
    to: ShopifyEx.Fulfillment.CancelFulfillmentAction,
    as: :perform

  @doc """
  Update tracking information for a fulfillment

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#post-fulfillments-fulfillment-id-update-tracking
  """
  @spec update_fulfillment_tracking(Client.t(), integer(), map()) ::
          {:ok, map()} | {:error, binary() | map()}
  defdelegate update_fulfillment_tracking(client, fulfillment_id, params),
    to: ShopifyEx.Fulfillment.UpdateTrackingAction,
    as: :perform

  @doc """
  Update a fulfillment of an order

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#put-orders-order-id-fulfillments-fulfillment-id
  """
  @spec update_fulfillment(Client.t(), integer(), integer(), map()) ::
          {:ok, map()} | {:error, binary() | map()}
  defdelegate update_fulfillment(client, order_id, fulfillment_id, params),
    to: ShopifyEx.Fulfillment.UpdateFulfillmentAction,
    as: :perform

  @doc """
  Update a fulfillment of an order

  **Reference**

  https://community.shopify.com/c/shopify-apis-and-sdks/how-to-update-the-order-status-through-the-api-along-with/td-p/540032
  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillmentevent#post-orders-order-id-fulfillments-fulfillment-id-events
  """
  @spec create_fulfillment_event(Client.t(), integer(), integer(), map()) ::
          {:ok, map()} | {:error, binary() | map()}
  defdelegate create_fulfillment_event(client, order_id, fulfillment_id, params),
    to: ShopifyEx.Fulfillment.CreateFulfillmentEventAction,
    as: :perform
end
