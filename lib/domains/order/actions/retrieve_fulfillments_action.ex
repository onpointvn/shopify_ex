defmodule ShopifyEx.Order.RetrieveFulfillmentsAction do
  @doc """
  Retrieve fulfillments associated with an order

  Reference

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#get-orders-order-id-fulfillments
  """
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
      request_params = ShopifyEx.MapHelper.clean_nil(request_params)
      execute_request(client, order_id, request_params)
    end
  end

  defp execute_request(client, order_id, params) do
    api_version = ShopifyEx.get_api_version()

    params = ShopifyEx.MapHelper.to_get_request_query(params)

    client
    |> ShopifyEx.ApiHelper.get(
      "/admin/api/#{api_version}/orders/#{order_id}/fulfillments.json",
      query: params
    )
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
