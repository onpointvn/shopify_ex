defmodule ShopifyEx.Order.RetrieveOrdersAction do
  @moduledoc """
  Retrieve a list of orders

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/order#get-orders
  """
  alias ShopifyEx.Constant
  alias ShopifyEx.MapHelper

  @financial_statuses [Constant.any_value() | ShopifyEx.Order.FinancialStatus.enum()]

  @fulfillment_statuses [Constant.any_value() | ShopifyEx.Order.FulfillmentStatus.enum()]

  @statuses [Constant.any_value() | ShopifyEx.Order.OrderStatus.enum()]

  @schema %{
    created_at_max: :utc_datetime,
    created_at_min: :utc_datetime,
    financial_status: [type: :string, in: @financial_statuses],
    fulfillment_status: [type: :string, in: @fulfillment_statuses],
    ids: {:array, :string},
    limit: [type: :integer, number: [min: 1, max: 250]],
    processed_at_max: :utc_datetime,
    processed_at_min: :utc_datetime,
    since_id: :integer,
    status: [type: :string, in: @statuses],
    updated_at_max: :utc_datetime,
    updated_at_min: :utc_datetime
  }
  def perform(client, params \\ %{}) do
    with {:ok, request_params} <- Tarams.cast(params, @schema) do
      request_params =
        request_params
        |> MapHelper.clean_nil()
        |> MapHelper.to_get_request_query()

      client
      |> ShopifyEx.ApiHelper.get("/orders.json", query: request_params)
      |> case do
        {:ok, %{status: 200, body: %{"orders" => orders}}} ->
          {:ok, orders}

        {:ok, %{body: body}} ->
          {:error, body}

        _error ->
          {:error, "Something went wrong"}
      end
    end
  end
end
