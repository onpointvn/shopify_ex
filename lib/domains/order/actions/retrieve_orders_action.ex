defmodule ShopifyEx.Order.RetrieveOrdersAction do
  @moduledoc """
  Retrieve a list of orders

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/order#get-orders
  """
  alias ShopifyEx.Constant

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
      request_params = ShopifyEx.MapHelper.clean_nil(request_params)
      execute_request(client, request_params)
    end
  end

  defp execute_request(client, params) do
    api_version = ShopifyEx.get_api_version()

    params = ShopifyEx.MapHelper.to_get_request_query(params)

    client
    |> ShopifyEx.ApiHelper.get("/admin/api/#{api_version}/orders.json", query: params)
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
