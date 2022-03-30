defmodule ShopifyEx.Inventory.RetrieveInventoryLevelsAction do
  @moduledoc """
  Retrieves a list of inventory levels

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/inventorylevel#get-inventory-levels
  """
  alias ShopifyEx.ApiHelper
  alias ShopifyEx.MapHelper

  @schema %{
    limit: [type: :integer, number: [min: 1, max: 250]],
    inventory_item_ids: {:array, :integer},
    location_ids: {:array, :integer},
    updated_at_min: :utc_datetime
  }
  def perform(client, params \\ %{}) do
    with {:ok, request_params} <- Tarams.cast(params, @schema),
         request_params <- build_request_params(request_params),
         {:ok, %{status: 200, body: %{"inventory_levels" => inventory_levels}} = env} <-
           ApiHelper.get(client, "/inventory_levels.json", query: request_params) do
      page_info = ApiHelper.extract_page_info(env)
      {:ok, %{inventory_levels: inventory_levels, page_info: page_info}}
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
