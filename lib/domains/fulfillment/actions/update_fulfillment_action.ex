defmodule ShopifyEx.Fulfillment.UpdateTrackingAction do
  @moduledoc """
  Update tracking for a fulfillment

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#post-fulfillments-fulfillment-id-update-tracking
  """
  @schema %{
    notify_customer: :boolean,
    tracking_info: %{
      number: [type: :string, required: true],
      company: [type: :string, required: true],
      url: [type: :string]
    }
  }
  def perform(client, fulfillment_id, params) do
    with {:ok, request_params} <- Tarams.cast(params, @schema),
         request_params <- build_request_params(request_params),
         {:ok, %{status: 200, body: %{"fulfillment" => fulfillment}}} <-
           ShopifyEx.ApiHelper.post(
             client,
             "/fulfillments/#{fulfillment_id}/update_tracking.json",
             request_params
           ) do
      {:ok, fulfillment}
    else
      {:ok, %{body: body}} ->
        {:error, body}

      {:error, errors} ->
        {:error, errors}

      _error ->
        {:error, "Something went wrong"}
    end
  end

  defp build_request_params(params) do
    params = ShopifyEx.MapHelper.clean_nil(params)
    %{fulfillment: params}
  end
end
