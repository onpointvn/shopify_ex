defmodule ShopifyEx.Order.ListOrdersAction do
  @schema %{
    created_at_max: :utc_datetime,
    created_at_min: :utc_datetime,
    financial_status: [type: :string, in: ShopifyEx.Order.FinancialStatus.enum()],
    fulfillment_status: [type: :string, in: ShopifyEx.Order.FulfillmentStatus.enum()],
    ids: {:array, :string},
    limit: [type: :integer, number: [min: 1, max: 250]],
    processed_at_max: :utc_datetime,
    processed_at_min: :utc_datetime,
    since_id: :integer,
    status: [type: :string, in: ShopifyEx.Order.OrderStatus.enum()],
    updated_at_max: :utc_datetime,
    updated_at_min: :utc_datetime
  }
  def perform(client, params) do
    with {:ok, request_params} <- Tarams.cast(params, @schema),
         request_params <- ShopifyEx.MapHelper.clean_nil(request_params),
         {:ok, data} <- execute_request(client, request_params) do
      {:ok, data}
    end
  end

  defp execute_request(client, params) do
    api_version = ShopifyEx.get_api_version()

    params = ShopifyEx.MapHelper.to_get_request_query(params)

    client
    |> ShopifyEx.ApiHelper.get("/admin/api/#{api_version}/orders.json", query: params)
    |> case do
      {:ok, %{status: 200, body: body}} ->
        {:ok, body}

      {:ok, %{body: body}} ->
        {:error, body}

      _error ->
        {:error, "Something went wrong"}
    end
  end
end
