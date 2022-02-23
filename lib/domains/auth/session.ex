defmodule ShopifyEx.Session do
  @type t :: %__MODULE__{
          shop: String.t() | nil,
          access_token: String.t() | nil
        }
  defstruct fun: nil,
            shop: nil,
            access_token: nil
end
