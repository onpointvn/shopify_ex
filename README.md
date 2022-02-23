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
  "code": "{your authorization code}",
  "hmac": "{hmac key}",
  "host": "{host key}",
  "shop": "{your shop name}.myshopify.com",
  "state": "{nonce value}",
  "timestamp": "{request unix timestamp}"
}
```

### Take the access token

We use this code to get an access token after authorized

```elixir
ShopifyEx.Session.request_token(
  "{your shop name}",
  "{your api key}",
  "{your secret api key}",
  "{your authorization code}"
)
```

After the `request_token` function executed successfully, we receive this value:

```elixir
{:ok, "{your access token}"}
```
