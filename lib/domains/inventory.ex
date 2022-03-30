defmodule ShopifyEx.Inventory do
  alias Tesla.Client

  @doc """
  Retrieve a location

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/location#get-locations-location-id
  """
  @spec retrieve_location(Client.t(), integer()) :: {:ok, map()} | {:error, binary() | map()}
  defdelegate retrieve_location(client, location_id),
    to: ShopifyEx.Inventory.RetrieveLocationAction,
    as: :perform

  @doc """
  Adjuct inventory level action

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/inventorylevel#post-inventory-levels-adjust
  """
  @spec adjust_inventory_level(Client.t(), map()) :: {:ok, map()} | {:error, binary() | map()}
  defdelegate adjust_inventory_level(client, params),
    to: ShopifyEx.Inventory.AdjustInventoryLevelAction,
    as: :perform

  @doc """
  Sets the inventory level for an inventory item at a location

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/inventorylevel#post-inventory-levels-set
  """
  @spec set_inventory_level(Client.t(), map()) :: {:ok, map()} | {:error, binary() | map()}
  defdelegate set_inventory_level(client, params),
    to: ShopifyEx.Inventory.SetInventoryLevelAction,
    as: :perform

  @moduledoc """
  Retrieves a list of inventory levels

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/inventorylevel#get-inventory-levels
  """
  @spec retrieve_inventory_levels(Client.t(), map()) ::
          {:ok, %{inventory_levels: list(map()), page_info: map()}} | {:error, binary() | map()}
  defdelegate retrieve_inventory_levels(client, params \\ %{}),
    to: ShopifyEx.Inventory.RetrieveInventoryLevelsAction,
    as: :perform
end
