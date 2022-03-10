defmodule ShopifyEx.Order.RetrieveOrdersAction do
  @moduledoc """
  Retrieve a list of orders

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/order#get-orders
  """
  alias ShopifyEx.ApiHelper
  alias ShopifyEx.Constant
  alias ShopifyEx.MapHelper

  @financial_statuses [Constant.any_value() | ShopifyEx.Order.FinancialStatus.enum()]

  @fulfillment_statuses [Constant.any_value() | ShopifyEx.Order.OrderFulfillmentStatus.enum()]

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
    updated_at_min: :utc_datetime,
    page_info: :string
  }
  def perform(client, params \\ %{}) do
    with {:ok, request_params} <- Tarams.cast(params, @schema),
         request_params <- build_request_params(request_params),
         {:ok, %{status: 200, body: %{"orders" => orders}} = env} <-
           ApiHelper.get(client, "/orders.json", query: request_params) do
      page_info = ApiHelper.extract_page_info(env)
      {:ok, %{orders: orders, page_info: page_info}}
    else
      {:ok, %{body: body}} ->
        {:error, body}

      _error ->
        {:error, "Something went wrong"}
    end
  end

  defp build_request_params(params) do
    params
    |> MapHelper.clean_nil()
    |> MapHelper.to_get_request_query()
  end
end
