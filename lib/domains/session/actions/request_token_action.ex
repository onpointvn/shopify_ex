defmodule ShopifyEx.Session.RequestTokenAction do
  @moduledoc """
  Handle requesting Shopify to take access token
  """
  alias ShopifyEx.Client

  def perform(shop, api_key, api_secret_key, code) do
    payload = %{
      client_id: api_key,
      client_secret: api_secret_key,
      code: code
    }

    Client.new(shop, nil)
    |> Client.post("/admin/oauth/access_token", payload)
    |> case do
      {:ok, %{status: 200, body: %{"access_token" => access_token}}} ->
        {:ok, access_token}

      {:ok, %{body: body}} ->
        extract_message(body)
        |> case do
          {:ok, message} ->
            {:error, message}

          _ ->
            {:error, "Request token failed with reason: #{body}"}
        end

      _error ->
        {:error, "Something went wrong"}
    end
  end

  defp extract_message(html) do
    Floki.parse_document(html)
    |> case do
      {:ok, document} ->
        reason =
          document
          |> Floki.find("div.content--block")
          |> Enum.map(fn {_, _, items} -> items end)
          |> Enum.find(fn items ->
            items
            |> Enum.map(fn {_, _, content} -> content end)
            |> Enum.concat()
            |> Enum.find(&(&1 == "What happened?"))
            |> Kernel.is_nil()
            |> Kernel.not()
          end)

        if is_nil(reason) do
          {:error, "Unknown error"}
        else
          message =
            reason
            |> Enum.filter(fn {element, _, _} -> element == "div" end)
            |> Enum.map(fn {_, _, content} -> content end)
            |> Enum.concat()
            |> List.first()
            |> String.trim()

          {:ok, message}
        end

      _ ->
        {:error, "Unknown error"}
    end
  end
end
