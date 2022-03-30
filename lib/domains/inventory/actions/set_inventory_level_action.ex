defmodule ShopifyEx.Inventory.SetInventoryLevelAction do
  @doc """
  Sets the inventory level for an inventory item at a location

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/inventorylevel#post-inventory-levels-set
  """
  @schema %{
    inventory_item_id: [type: :integer, required: true],
    location_id: [type: :integer, required: true],
    available: [type: :integer, required: true]
  }
  def perform(client, params) do
    with {:ok, request_params} <- Tarams.cast(params, @schema),
         {:ok, %{status: 200, body: %{"inventory_level" => inventory_level}}} <-
           ShopifyEx.ApiHelper.post(client, "/inventory_levels/set.json", request_params) do
      {:ok, inventory_level}
    else
      {:ok, %{body: body}} ->
        {:error, body}

      {:error, errors} ->
        {:error, errors}

      _error ->
        {:error, "Something went wrong"}
    end
  end
end
