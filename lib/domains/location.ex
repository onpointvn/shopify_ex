defmodule ShopifyEx.Location do
  alias Tesla.Client

  @moduledoc """
  Retrieve a location

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/location#get-locations-location-id
  """
  @spec retrieve_location(Client.t(), integer()) :: {:ok, map()} | {:error, binary() | map()}
  defdelegate retrieve_location(client, location_id),
    to: ShopifyEx.Location.RetrieveLocationAction,
    as: :perform
end
