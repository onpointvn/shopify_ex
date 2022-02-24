defmodule ShopifyEx.MapHelper do
  @doc """
  Clean nil value from map/list recursively

  Example:

      clean_nil(%{a: 1, b: nil, c: [1, 2, nil]})
      #> %{a: 1, c: [1, 2]}
  """
  def clean_nil(%{} = params) when is_map(params) and not is_struct(params) do
    Enum.reduce(params, %{}, fn
      {_key, nil}, acc ->
        acc

      {key, value}, acc ->
        Map.put(acc, key, clean_nil(value))
    end)
  end

  def clean_nil(params) when is_list(params) do
    Enum.reduce(params, [], fn
      nil, acc ->
        acc

      item, acc ->
        [clean_nil(item) | acc]
    end)
    |> Enum.reverse()
  end

  def clean_nil(value), do: value

  def to_get_request_query(params) when is_map(params) do
    Enum.reduce(params, %{}, fn {key, value}, acc ->
      Map.put(acc, key, to_get_request_value(value))
    end)
  end

  defp to_get_request_value(values) when is_list(values) do
    Enum.join(values, ",")
  end

  defp to_get_request_value(%DateTime{} = value) do
    value
    |> DateTime.truncate(:second)
    |> DateTime.to_iso8601()
  end

  defp to_get_request_value(%NaiveDateTime{} = value) do
    value
    |> NaiveDateTime.truncate(:second)
    |> NaiveDateTime.to_iso8601()
  end

  defp to_get_request_value(value), do: value
end
