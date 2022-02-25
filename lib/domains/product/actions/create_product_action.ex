defmodule ShopifyEx.Product.CreateProductAction do
  @moduledoc """
  Handle creating a product action
  """
  @variant_schema %{
    sku: [type: :string, required: true]
  }

  @schema %{
    title: [type: :string, required: true],
    variants: {:array, @variant_schema}
  }

  def perform(client, params) do
    with {:ok, request_params} <- Tarams.cast(params, @schema) do
      request_params = ShopifyEx.MapHelper.clean_nil(request_params)

      client
      |> ShopifyEx.ApiHelper.post("/products.json", %{product: request_params})
      |> case do
        {:ok, %{status: 201, body: %{"product" => product}}} ->
          {:ok, product}

        {:ok, %{body: body}} ->
          {:error, body}

        _error ->
          {:error, "Something went wrong"}
      end
    end
  end
end
