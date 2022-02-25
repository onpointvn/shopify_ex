defmodule ShopifyEx.Order.CreateOrderAction do
  @moduledoc """
  Create an order

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/order#post-orders
  """
  @line_item_schema %{
    variant_id: [type: :integer, required: true],
    quantity: [type: :integer, required: true, number: [min: 1]]
  }

  @schema %{
    line_items: [type: {:array, @line_item_schema}, required: true, length: [min: 1]]
  }

  def perform(client, params) do
    with {:ok, request_params} <- Tarams.cast(params, @schema) do
      request_params = ShopifyEx.MapHelper.clean_nil(request_params)

      client
      |> ShopifyEx.ApiHelper.post("/orders.json", %{order: request_params})
      |> case do
        {:ok, %{status: 201, body: %{"order" => order}}} ->
          {:ok, order}

        {:ok, %{body: body}} ->
          {:error, body}

        _error ->
          {:error, "Something went wrong"}
      end
    end
  end
end
