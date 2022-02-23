defmodule ShopifyEx.Product.CreateProductAction do
  alias ShopifyEx.Client

  @schema %{
    title: [type: :string, required: true],
    body_html: :string,
    vendor: :string,
    product_type: :string,
    status: [type: :string, in: ShopifyEx.ProductStatus.enum()],
    tags: {:array, :string}
  }

  def perform(session, params) do
    with {:ok, request_params} <- Tarams.cast(params, @schema),
         request_params <- ShopifyEx.MapHelper.clean_nil(request_params),
         {:ok, data} <- execute_request(session, request_params) do
      {:ok, data}
    end
  end

  defp execute_request(session, params) do
    api_version = ShopifyEx.get_api_version()

    request_params = %{
      product: params
    }

    Client.new(session)
    |> Client.post("/admin/api/#{api_version}/products.json", request_params)
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
