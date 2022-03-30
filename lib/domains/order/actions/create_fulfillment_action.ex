defmodule ShopifyEx.Order.CreateFulfillmentAction do
  @moduledoc """
  Create a new Fulfillment for an order

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#post-orders-order-id-fulfillments
  """

  @line_item_schema %{
    id: :integer
  }

  @origin_address_schema %{
    address1: :string,
    address2: :string,
    city: :string,
    country_code: :string,
    province_code: :string,
    zip: :string
  }

  @schema %{
    line_items: {:array, @line_item_schema},
    location_id: [type: :integer, required: true],
    origin_address: @origin_address_schema,
    # receipt: :map,
    # service: :string,
    shipment_status: [type: :string, in: ShopifyEx.Fulfillment.ShipmentStatus.enum()],
    status: [type: :string, in: ShopifyEx.Fulfillment.FulfillmentStatus.enum()],
    tracking_numbers: {:array, :string},
    tracking_urls: {:array, :string}
  }
  def perform(client, order_id, params) do
    with {:ok, request_params} <- Tarams.cast(params, @schema) do
      request_params = ShopifyEx.MapHelper.clean_nil(request_params)

      client
      |> ShopifyEx.ApiHelper.post(
        "/orders/#{order_id}/fulfillments.json",
        %{fulfillment: request_params}
      )
      |> case do
        {:ok, %{status: 201, body: %{"fulfillment" => fulfillment}}} ->
          {:ok, fulfillment}

        {:ok, %{body: body}} ->
          {:error, body}

        _error ->
          {:error, "Something went wrong"}
      end
    end
  end
end
