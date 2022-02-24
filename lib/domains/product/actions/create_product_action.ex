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
    with {:ok, request_params} <- Tarams.cast(params, @schema),
         request_params <- ShopifyEx.MapHelper.clean_nil(request_params),
         {:ok, data} <- execute_request(client, request_params) do
      {:ok, data}
    end
  end

  defp execute_request(client, params) do
    api_version = ShopifyEx.get_api_version()

    request_params = %{
      product: params
    }

    client
    |> ShopifyEx.ApiHelper.post("/admin/api/#{api_version}/products.json", request_params)
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
