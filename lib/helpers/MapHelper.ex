defmodule ShopifyEx.MapHelper do
  @doc """
  Clean nil value from map/list recursively

  Example:

      clean_nil(%{a: 1, b: nil, c: [1, 2, nil]})
      #> %{a: 1, c: [1, 2]}
  """
  def clean_nil(params) when is_map(params) do
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
end
