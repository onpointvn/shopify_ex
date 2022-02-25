defmodule ShopifyEx.Order.RetrieveFulfillmentsAction do
  @moduledoc """
  Retrieve fulfillments associated with an order

  Reference

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#get-orders-order-id-fulfillments
  """
  alias ShopifyEx.MapHelper

  @schema %{
    created_at_max: :utc_datetime,
    created_at_min: :utc_datetime,
    limit: [type: :integer, number: [min: 1, max: 250]],
    since_id: :integer,
    updated_at_max: :utc_datetime,
    updated_at_min: :utc_datetime
  }
  def perform(client, order_id, params \\ %{}) do
    with {:ok, request_params} <- Tarams.cast(params, @schema) do
      request_params =
        request_params
        |> MapHelper.clean_nil()
        |> MapHelper.to_get_request_query()

      client
      |> ShopifyEx.ApiHelper.get("/orders/#{order_id}/fulfillments.json", query: request_params)
      |> case do
        {:ok, %{status: 200, body: %{"fulfillments" => fulfillments}}} ->
          {:ok, fulfillments}

        {:ok, %{body: body}} ->
          {:error, body}

        _error ->
          {:error, "Something went wrong"}
      end
    end
  end
end
