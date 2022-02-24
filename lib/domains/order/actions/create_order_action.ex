defmodule ShopifyEx.Order.CreateOrderAction do
  @moduledoc """
  Handle creating an order action
  """
  @line_item_schema %{
    variant_id: [type: :integer, required: true],
    quantity: [type: :integer, required: true, number: [min: 1]]
  }

  @schema %{
    line_items: [type: {:array, @line_item_schema}, required: true, length: [min: 1]]
  }

  def perform(client, params) do
    with {:ok, request_params} <- Tarams.cast(params, @schema),
         request_params <- ShopifyEx.MapHelper.clean_nil(request_params),
         {:ok, order} <- execute_request(client, request_params) do
      {:ok, order}
    end
  end

  defp execute_request(client, params) do
    api_version = ShopifyEx.get_api_version()

    request_params = %{
      order: params
    }

    client
    |> ShopifyEx.ApiHelper.post("/admin/api/#{api_version}/orders.json", request_params)
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
