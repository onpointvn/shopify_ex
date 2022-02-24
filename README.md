# Shopify Extension

This extension provides a method to connect Shopify Admin REST API easily via built functions.

## Structure

The `lib` directory in this extension is organized by this following structure:

```
lib
| -- domains
|    | -- <domain name>
|    |    | -- actions
|    |    |    | -- <action 1>
|    |    |    | -- <action 2>
|    | -- <domain module>.ex
| -- helpers
|    | -- <helper 1>.ex
|    | -- <helper 2>.ex
```

## Authentication

### Overview

To send requests to Shopify Admin REST API, we must add a token into the HTTP request header by the `X-Shopify-Access-Token` header field.

```bash
curl -X GET \ https://{shop}.myshopify.com/admin/api/2021-07/shop.json \
  -H 'Content-Type: application/json' \
  -H 'X-Shopify-Access-Token: {your access token}'
```

### Get access token

**Authorize your Shopify app**

We can create an authorize url using this code:

```elixir
ShopifyEx.Auth.create_authorize_url(
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

**Take the access token**

We use this code to get an access token after authorized

```elixir
ShopifyEx.Auth.request_token(
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

### Integrate to each action

Each action (or function) to connect Shopify is decorated the `client` parameter to integrate the access token. For example:

```elixir
client = ShopifyEx.ApiHelper.client("{your shop name}", access_token: "{your access token}")

ShopifyEx.Order.create_order(client, params)
```
