defmodule ShopifyEx.Order.CancelOrderAction do
  @moduledoc """
  Cancel an order

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/order#post-orders-order-id-cancel
  """

  def perform(client, order_id) do
    execute_request(client, order_id)
  end

  defp execute_request(client, order_id) do
    api_version = ShopifyEx.get_api_version()

    client
    |> ShopifyEx.ApiHelper.post(
      "/admin/api/#{api_version}/orders/#{order_id}/cancel.json",
      %{}
    )
    |> case do
      {:ok, %{status: 200, body: %{"order" => order}}} ->
        {:ok, order}

      {:ok, %{body: body}} ->
        {:error, body}

      _error ->
        {:error, "Something went wrong"}
    end
  end
end
