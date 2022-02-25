defmodule ShopifyEx.Location.RetrieveLocationAction do
  @moduledoc """
  Retrieve a location

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/location#get-locations-location-id
  """
  def perform(client, location_id) do
    client
    |> ShopifyEx.ApiHelper.get("/locations/#{location_id}.json")
    |> case do
      {:ok, %{status: 200, body: %{"location" => location}}} ->
        {:ok, location}

      {:ok, %{body: body}} ->
        {:error, body}

      _error ->
        {:error, "Something went wrong"}
    end
  end
end
