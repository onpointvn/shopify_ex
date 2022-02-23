# Shopify Extension

## 1. Tutorial

### Authorize your Shopify app

We can create an authorize url using this code:

```elixir
ShopifyEx.Session.create_authorize_url(
  "{your shop name}",
  "{your api key}",
  "{your redirect uri}",
  access_scopes: ["your optional access scopes"]
)
```

For the `access_scopes` field, we can use values from the `ShopifyEx.AccessScope` enumeration.

We call the generated url, accept the authorize request, and receive this following response from Shopify:

```json
{
  "code": "619b5787ca13d8814cde99556b934e62",
  "hmac": "7fa15cee64622a6c25ebbbb35de99d52bfe6fdf6c09e09099908b6550709b075",
  "host": "a2hhbmgtb25wb2ludC5teXNob3BpZnkuY29tL2FkbWlu",
  "shop": "khanh-onpoint.myshopify.com",
  "state": "cd90f17a03744a0db9e6062d4e74e991",
  "timestamp": "1645585256"
}
```
