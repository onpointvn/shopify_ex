defmodule ShopifyEx.Fulfillment.CancelFulfillmentAction do
  @moduledoc """
  Cancel a fulfillment

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#post-fulfillments
  """

  def perform(client, fulfillment_id) do
    client
    |> ShopifyEx.ApiHelper.post("/fulfillments/#{fulfillment_id}/cancel.json", %{})
    |> case do
      {:ok, %{status: 200, body: %{"fulfillment" => fulfillment}}} ->
        {:ok, fulfillment}

      {:ok, %{body: body}} ->
        {:error, body}

      _error ->
        {:error, "Something went wrong"}
    end
  end
end
