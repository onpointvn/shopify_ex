defmodule ShopifyEx.Order.FinancialStatus do
  @moduledoc """
  Order financial status enumeration

  Reference

  https://shopify.dev/api/admin-rest/2022-01/resources/order#get-orders
  """
  def paid, do: "paid"

  def unpaid, do: "unpaid"

  def voided, do: "voided"

  def pending, do: "pending"

  def refunded, do: "refunded"

  def authorized, do: "authorized"

  def partially_paid, do: "partially_paid"

  def partially_refunded, do: "partially_refunded"

  def enum do
    [
      paid(),
      unpaid(),
      voided(),
      pending(),
      refunded(),
      authorized(),
      partially_paid(),
      partially_refunded()
    ]
  end
end
