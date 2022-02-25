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
  Retrieve orders

  **Parameters**

  - `client [Tesla.Client]`: the request client.
  - `params [map]`: the filter parameters.

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/order#get-orders

  **Example**

  ```
  iex> Order.retrieve_orders(client, params)
    {
      :ok,
      [
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
  ```
  """
  @spec retrieve_orders(Client.t(), map()) :: {:ok, list(map())} | {:error, binary() | map()}
  defdelegate retrieve_orders(client, params \\ %{}),
    to: ShopifyEx.Order.RetrieveOrdersAction,
    as: :perform

  @doc """
  Retrieve a specific order

  **Parameters**

  - `client [Tesla.Client]`: the request client.
  - `order_id [integer]`: the order id.

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/order#get-orders-order-id

  **Example**

  ```
  iex> Order.retrieve_order(client, order_id)
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
    }
  ```
  """
  @spec retrieve_order(Client.t(), integer()) :: {:ok, map()} | {:error, binary() | map()}
  defdelegate retrieve_order(client, order_id),
    to: ShopifyEx.Order.RetrieveOrderAction,
    as: :perform

  @doc """
  Cancel an order

  **Parameters**

  - `client [Tesla.Client]`: the request client.
  - `order_id [integer]`: the order id.

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/order#post-orders-order-id-cancel

  ```
  iex>  Order.cancel_order(client, order_id)
    {
      :ok,
      %{
        "total_line_items_price" => "0",
        "number" => 1,
        "referring_site" => nil,
        "order_status_url" => "https://khanh-onpoint.myshopify.com/62900699381/orders/d56324f4a449ccac74adc1a427afb00a/authenticate?key=8f3445575d1daa59fc286aa40ad56117",
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
        "id" => 4667009040629,
        "shipping_lines" => [],
        "fulfillments" => [],
        "current_total_tax_set" => %{
          "presentment_money" => %{"amount" => "0", "currency_code" => "VND"},
          "shop_money" => %{"amount" => "0", "currency_code" => "VND"}
        },
        "subtotal_price" => "0",
        "current_total_duties_set" => nil,
        "user_id" => nil,
        "token" => "d56324f4a449ccac74adc1a427afb00a",
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
        "order_number" => 1001,
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
        "admin_graphql_api_id" => "gid://shopify/Order/4667009040629",
        "created_at" => "2022-02-24T17:06:34+07:00",
        "name" => "#1001",
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
        "processed_at" => "2022-02-24T17:06:34+07:00",
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
        "updated_at" => "2022-02-24T17:06:34+07:00",
        "line_items" => [
          %{
            "admin_graphql_api_id" => "gid://shopify/LineItem/11989864317173",
            "discount_allocations" => [],
            "duties" => [],
            "fulfillable_quantity" => 1,
            "fulfillment_service" => "manual",
            "fulfillment_status" => nil,
            "gift_card" => false,
            "grams" => 0,
            "id" => 11989864317173,
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
  """
  @spec cancel_order(Client.t(), integer()) :: {:ok, map()} | {:error, binary() | map()}
  defdelegate cancel_order(client, order_id),
    to: ShopifyEx.Order.CancelOrderAction,
    as: :perform

  @doc """
  Create a new Fulfillment

   **Parameters**

  - `client [Tesla.Client]`: the request client.
  - `order_id [integer]`: the order id.
  - `params [map]`: the fulfillment object parameters.

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#post-orders-order-id-fulfillments
  """
  @spec create_fulfillment(Client.t(), integer(), map()) ::
          {:ok, map()} | {:error, binary() | map()}
  defdelegate create_fulfillment(client, order_id, params),
    to: ShopifyEx.Order.CreateFulfillmentAction,
    as: :perform

  @doc """
  Retrieve fulfillments associated with an order

  **Parameters**

  - `client [Tesla.Client]`: the request client.
  - `order_id [integer]`: the order id.
  - `params [map]`: the filter parameters.

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#get-orders-order-id-fulfillments

  **Example**

  ```
  iex> Order.retrieve_fulfillments(client, order_id, params)
    {
      :ok,
      [
        %{
          "admin_graphql_api_id" => "gid://shopify/Fulfillment/4171812241653",
          "created_at" => "2022-02-25T11:17:37+07:00",
          "id" => 4171812241653,
          "line_items" => [
            %{
              "admin_graphql_api_id" => "gid://shopify/LineItem/11989864612085",
              "discount_allocations" => [],
              "duties" => [],
              "fulfillable_quantity" => 0,
              "fulfillment_line_item_id" => 10225069555957,
              "fulfillment_service" => "manual",
              "fulfillment_status" => "fulfilled",
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
          ],
          "location_id" => 67749085429,
          "name" => "#1002.1",
          "order_id" => 4667009270005,
          "origin_address" => nil,
          "receipt" => %{},
          "service" => "manual",
          "shipment_status" => nil,
          "status" => "success",
          "tracking_company" => nil,
          "tracking_number" => nil,
          "tracking_numbers" => [],
          "tracking_url" => nil,
          "tracking_urls" => [],
          "updated_at" => "2022-02-25T11:17:37+07:00"
        }
      ]
    }
  ```
  """
  @spec retrieve_fulfillments(Client.t(), integer(), map()) ::
          {:ok, list(map())} | {:error, binary() | map()}
  defdelegate retrieve_fulfillments(client, order_id, params \\ %{}),
    to: ShopifyEx.Order.RetrieveFulfillmentsAction,
    as: :perform
end
