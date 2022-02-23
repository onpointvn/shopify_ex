defmodule ShopifyEx.AccessScope do
  @moduledoc """
  Shopify access scopes

  Reference: https://shopify.dev/api/usage/access-scopes
  """
  @doc """
  Read all orders rather than the default window of 60 days worth of orders

  Note: to use this scope, we should follow this instruction:
    https://shopify.dev/apps/auth/oauth/getting-started#orders-permissions
  """
  def read_all_orders, do: "read_all_orders"

  # FulfillmentOrder resources assigned to a location managed by your fulfillment service
  def read_assigned_fulfillment_orders, do: "read_assigned_fulfillment_orders"
  def write_assigned_fulfillment_orders, do: "write_assigned_fulfillment_orders"

  # Checkouts
  def read_checkouts, do: "read_checkouts"
  def write_checkouts, do: "write_checkouts"

  # Article, Blog, Comment, Page, and Redirect
  def read_content, do: "read_content"
  def write_content, do: "write_content"

  # Customer and Saved Search permissions required
  def read_customers, do: "read_customers"
  def write_customers, do: "write_customers"

  # GraphQL Admin API Discounts features
  def read_discounts, do: "read_discounts"
  def write_discounts, do: "write_discounts"

  # Draft Order permissions required
  def read_draft_orders, do: "read_draft_orders"
  def write_draft_orders, do: "write_draft_orders"

  # GraphQL Admin API GenericFile object and fileCreate, fileUpdate, and fileDelete mutations
  def read_files, do: "read_files"
  def write_files, do: "write_files"

  # Fulfillment Service
  def read_fulfillments, do: "read_fulfillments"
  def write_fulfillments, do: "write_fulfillments"

  # Gift Card shopify plus
  def read_gift_cards, do: "read_gift_cards"
  def write_gift_cards, do: "write_gift_cards"

  # Inventory Level and Inventory Item
  def read_inventory, do: "read_inventory"
  def write_inventory, do: "write_inventory"

  # GraphQL Admin API Shop Policy
  def read_legal_policies, do: "read_legal_policies"

  # GraphQL Admin API Shop Locale
  def read_locales, do: "read_locales"
  def write_locales, do: "write_locales"

  # Location
  def read_locations, do: "read_locations"

  # Marketing Event
  def read_marketing_events, do: "read_marketing_events"
  def write_marketing_events, do: "write_marketing_events"

  # MerchantApprovalSignals
  def read_merchant_approval_signals, do: "read_merchant_approval_signals"

  # FulfillmentOrder resources assigned to merchant-managed locations
  def read_merchant_managed_fulfillment_orders, do: "read_merchant_managed_fulfillment_orders"
  def write_merchant_managed_fulfillment_orders, do: "write_merchant_managed_fulfillment_orders"

  # Abandoned checkouts, Customer, Fulfillment, Order, and Transaction resources permissions required
  def read_orders, do: "read_orders"
  def write_orders, do: "write_orders"

  # GraphQL Admin API PaymentSchedule and PaymentTerms objects
  def read_payment_terms, do: "read_payment_terms"
  def write_payment_terms, do: "write_payment_terms"

  # Price Rules
  def read_price_rules, do: "read_price_rules"
  def write_price_rules, do: "write_price_rules"

  # Product, Product Variant, Product Image, Collect, Custom Collection, and Smart Collection
  def read_products, do: "read_products"
  def write_products, do: "write_products"

  # Product Listing and Collection Listing
  def read_product_listings, do: "read_product_listings"

  # Product publishing and Collection publishing
  def read_publications, do: "read_publications"
  def write_publications, do: "write_publications"

  # Reports
  def read_reports, do: "read_reports"
  def write_reports, do: "write_reports"

  # ResourceFeedback
  def read_resource_feedbacks, do: "read_resource_feedbacks"
  def write_resource_feedbacks, do: "write_resource_feedbacks"

  # Script Tag
  def read_script_tags, do: "read_script_tags"
  def write_script_tags, do: "write_script_tags"

  # Carrier Service, Country, and Province
  def read_shipping, do: "read_shipping"
  def write_shipping, do: "write_shipping"

  # Shopify Payments Dispute resource
  def read_shopify_payments_disputes, do: "read_shopify_payments_disputes"

  # Shopify Payments Payout, Balance, and Transaction resources
  def read_shopify_payments_payouts, do: "read_shopify_payments_payouts"

  # Asset and Theme
  def read_themes, do: "read_themes"
  def write_themes, do: "write_themes"

  # GraphQL Admin API Translatable object
  def read_translations, do: "read_translations"
  def write_translations, do: "write_translations"

  # FulfillmentOrder resources assigned to a location managed by any fulfillment service
  def read_third_party_fulfillment_orders, do: "read_third_party_fulfillment_orders"
  def write_third_party_fulfillment_orders, do: "write_third_party_fulfillment_orders"

  # User shopify plus
  def read_users, do: "read_users"
  def write_users, do: "write_users"

  # GraphQL Admin API OrderStagedChange types and order editing features
  def read_order_edits, do: "read_order_edits"
  def write_order_edits, do: "write_order_edits"

  def enum do
    [
      read_all_orders(),
      read_assigned_fulfillment_orders(),
      write_assigned_fulfillment_orders(),
      read_checkouts(),
      write_checkouts(),
      read_content(),
      write_content(),
      read_customers(),
      write_customers(),
      read_discounts(),
      write_discounts(),
      read_draft_orders(),
      write_draft_orders(),
      read_files(),
      write_files(),
      read_fulfillments(),
      write_fulfillments(),
      read_gift_cards(),
      write_gift_cards(),
      read_inventory(),
      write_inventory(),
      read_legal_policies(),
      read_locales(),
      write_locales(),
      read_locations(),
      read_marketing_events(),
      write_marketing_events(),
      read_merchant_approval_signals(),
      read_merchant_managed_fulfillment_orders(),
      write_merchant_managed_fulfillment_orders(),
      read_orders(),
      write_orders(),
      read_payment_terms(),
      write_payment_terms(),
      read_price_rules(),
      write_price_rules(),
      read_products(),
      write_products(),
      read_product_listings(),
      read_publications(),
      write_publications(),
      read_reports(),
      write_reports(),
      read_resource_feedbacks(),
      write_resource_feedbacks(),
      read_script_tags(),
      write_script_tags(),
      read_shipping(),
      write_shipping(),
      read_shopify_payments_disputes(),
      read_shopify_payments_payouts(),
      read_themes(),
      write_themes(),
      read_translations(),
      write_translations(),
      read_third_party_fulfillment_orders(),
      write_third_party_fulfillment_orders(),
      read_users(),
      write_users(),
      read_order_edits(),
      write_order_edits()
    ]
  end
end
