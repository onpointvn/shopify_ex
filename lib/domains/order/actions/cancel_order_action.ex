defmodule ShopifyEx.Order.CancelOrderAction do
  @moduledoc """
  Cancel an order

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/order#post-orders-order-id-cancel
  """

  def perform(client, order_id) do
    client
    |> ShopifyEx.ApiHelper.post("/orders/#{order_id}/cancel.json", %{})
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
