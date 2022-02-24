defmodule ShopifyEx.Order do
  alias Tesla.Client

  @doc """
  Create an order

  **Parameters**

  - `client [Tesla.Client]`: the request client.
  - `params [map]`: the order object parameters.

  **Example**

  ```
  iex> Order.create_order(client, params)
    {
      :ok,
      %{
        "total_line_items_price" => "0",
        "number" => 2,
        "referring_site" => nil,
        "order_status_url" => "https://khanh-onpoint.myshopify.com/62900699381/orders/33ffe25cc14f0c05bea526f48df5ecc1/authenticate?key=bf6c3d079985eff9b7f6f548448d78e3",
        "taxes_included" => false,
        "original_total_duties_set" => nil,
        "confirmed" => true,
        "checkout_token" => nil,
        "landing_site" => nil,
        "phone" => nil,
        "location_id" => nil,
        "total_shipping_price_set" => %{
          "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
          "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
        },
        "note_attributes" => [],
        "landing_site_ref" => nil,
        "customer_locale" => nil,
        "total_price" => "0",
        "id" => 4667009270005,
        "shipping_lines" => [],
        "fulfillments" => [],
        "current_total_tax_set" => %{
          "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
          "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
        },
        "subtotal_price" => "0",
        "current_total_duties_set" => nil,
        "user_id" => nil,
        "token" => "33ffe25cc14f0c05bea526f48df5ecc1",
        "currency" => "VND",
        "closed_at" => nil,
        "refunds" => [],
        "total_outstanding" => "0",
        "test" => false,
        "total_line_items_price_set" => %{
          "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
          "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
        },
        "total_price_usd" => "0.00",
        "order_number" => 1002,
        "note" => nil,
        "app_id" => 6507519,
        "payment_terms" => nil,
        "gateway" => "",
        "cancelled_at" => nil,
        "processing_method" => "",
        "tax_lines" => [],
        "payment_gateway_names" => [],
        "buyer_accepts_marketing" => false,
        "current_total_price_set" => %{
          "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
          "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
        },
        "current_total_discounts_set" => %{
          "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
          "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
        },
        "admin_graphql_api_id" => "gid://shopify/Order/4667009270005",
        "created_at" => "2022-02-24T17:07:31+07:00",
        "name" => "#1002",
        "subtotal_price_set" => %{
          "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
          "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
        },
        "total_discounts" => "0",
        "current_total_tax" => "0",
        "total_discounts_set" => %{
          "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
          "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
        },
        "current_subtotal_price_set" => %{
          "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
          "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
        },
        "total_tax_set" => %{
          "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
          "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
        },
        "source_url" => nil,
        "current_subtotal_price" => "0",
        "cart_token" => nil,
        "checkout_id" => nil,
        "total_tip_received" => "0",
        "contact_email" => nil,
        "presentment_currency" => "VND",
        "processed_at" => "2022-02-24T17:07:31+07:00",
        "email" => "",
        "device_id" => nil,
        "source_identifier" => nil,
        "discount_codes" => [],
        "current_total_discounts" => "0",
        "total_price_set" => %{
          "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
          "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
        },
        "source_name" => "6507519",
        "discount_applications" => [],
        "cancel_reason" => nil,
        "fulfillment_status" => nil,
        "financial_status" => "paid",
        "total_weight" => 0,
        "browser_ip" => nil,
        "estimated_taxes" => false,
        "reference" => nil,
        "total_tax" => "0",
        "current_total_price" => "0",
        "tags" => "",
        "updated_at" => "2022-02-24T17:07:31+07:00",
        "line_items" => [
          %{
            "admin_graphql_api_id" => "gid://shopify/LineItem/11989864612085",
            "discount_allocations" => [],
            "duties" => [],
            "fulfillable_quantity" => 1,
            "fulfillment_service" => "manual",
            "fulfillment_status" => nil,
            "gift_card" => false,
            "grams" => 0,
            "id" => 11989864612085,
            "name" => "Test product 1111",
            "price" => "0",
            "price_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "product_exists" => true,
            "product_id" => 7582732648693,
            "properties" => [],
            "quantity" => 1,
            "requires_shipping" => true,
            "sku" => "TEST_001",
            "tax_lines" => [],
            "taxable" => true,
            "title" => "Test product 1111",
            "total_discount" => "0",
            "total_discount_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "variant_id" => 42444832243957,
            "variant_inventory_management" => nil,
            "variant_title" => nil,
            "vendor" => "Khanh OnPoint"
          }
        ]
      }
    }
  ```

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/order#post-orders
  """
  @spec create_order(Client.t(), map()) :: {:ok, map()} | {:error, binary() | map()}
  defdelegate create_order(client, params),
    to: ShopifyEx.Order.CreateOrderAction,
    as: :perform

  @doc """
  List orders

  **Parameters**

  - `client [Tesla.Client]`: the request client.
  - `params [map]`: the filter parameters.

  **Example**

  ```
  iex> Order.create_order(client, params)
    {
      :ok,
      %{
        "orders" => [
          %{
            "total_line_items_price" => "0",
            "number" => 2,
            "referring_site" => nil,
            "order_status_url" => "https://khanh-onpoint.myshopify.com/62900699381/orders/33ffe25cc14f0c05bea526f48df5ecc1/authenticate?key=bf6c3d079985eff9b7f6f548448d78e3",
            "taxes_included" => false,
            "original_total_duties_set" => nil,
            "confirmed" => true,
            "checkout_token" => nil,
            "landing_site" => nil,
            "phone" => nil,
            "location_id" => nil,
            "total_shipping_price_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "note_attributes" => [],
            "landing_site_ref" => nil,
            "customer_locale" => nil,
            "total_price" => "0",
            "id" => 4667009270005,
            "shipping_lines" => [],
            "fulfillments" => [],
            "current_total_tax_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "subtotal_price" => "0",
            "current_total_duties_set" => nil,
            "user_id" => nil,
            "token" => "33ffe25cc14f0c05bea526f48df5ecc1",
            "currency" => "VND",
            "closed_at" => nil,
            "refunds" => [],
            "total_outstanding" => "0",
            "test" => false,
            "total_line_items_price_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "total_price_usd" => "0.00",
            "order_number" => 1002,
            "note" => nil,
            "app_id" => 6507519,
            "payment_terms" => nil,
            "gateway" => "",
            "cancelled_at" => nil,
            "processing_method" => "",
            "tax_lines" => [],
            "payment_gateway_names" => [],
            "buyer_accepts_marketing" => false,
            "current_total_price_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "current_total_discounts_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "admin_graphql_api_id" => "gid://shopify/Order/4667009270005",
            "created_at" => "2022-02-24T17:07:31+07:00",
            "name" => "#1002",
            "subtotal_price_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "total_discounts" => "0",
            "current_total_tax" => "0",
            "total_discounts_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "current_subtotal_price_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "total_tax_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "source_url" => nil,
            "current_subtotal_price" => "0",
            "cart_token" => nil,
            "checkout_id" => nil,
            "total_tip_received" => "0",
            "contact_email" => nil,
            "presentment_currency" => "VND",
            "processed_at" => "2022-02-24T17:07:31+07:00",
            "email" => "",
            "device_id" => nil,
            "source_identifier" => nil,
            "discount_codes" => [],
            "current_total_discounts" => "0",
            "total_price_set" => %{
              "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
              "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
            },
            "source_name" => "6507519",
            "discount_applications" => [],
            "cancel_reason" => nil,
            "fulfillment_status" => nil,
            "financial_status" => "paid",
            "total_weight" => 0,
            "browser_ip" => nil,
            "estimated_taxes" => false,
            "reference" => nil,
            "total_tax" => "0",
            "current_total_price" => "0",
            "tags" => "",
            "updated_at" => "2022-02-24T17:07:32+07:00",
            "line_items" => [
              %{
                "admin_graphql_api_id" => "gid://shopify/LineItem/11989864612085",
                "discount_allocations" => [],
                "duties" => [],
                "fulfillable_quantity" => 1,
                "fulfillment_service" => "manual",
                "fulfillment_status" => nil,
                "gift_card" => false,
                "grams" => 0,
                "id" => 11989864612085,
                "name" => "Test product 1111",
                "price" => "0",
                "price_set" => %{
                  "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
                  "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
                },
                "product_exists" => true,
                "product_id" => 7582732648693,
                "properties" => [],
                "quantity" => 1,
                "requires_shipping" => true,
                "sku" => "TEST_001",
                "tax_lines" => [],
                "taxable" => true,
                "title" => "Test product 1111",
                "total_discount" => "0",
                "total_discount_set" => %{
                  "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
                  "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
                },
                "variant_id" => 42444832243957,
                "variant_inventory_management" => nil,
                "variant_title" => nil,
                "vendor" => "Khanh OnPoint"
              }
            ]
          }
        ]
      }
    }
  ```

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/order#get-orders
  """
  @spec list_orders(Client.t(), map()) :: {:ok, map()} | {:error, binary() | map()}
  defdelegate list_orders(client, params),
    to: ShopifyEx.Order.ListOrdersAction,
    as: :perform
end
