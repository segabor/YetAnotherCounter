# About

Sample app built in Vapor

## Get counter value

### REST command

`GET /counter`

### Response

```json
{
  "value": 0
}
```

## Set counter value

To set value, just push a JSON object having just one field `value`:

### REST command

`POST /counter`

Request body:

```json
{
  "value": 0
}
```

### Response

Empty response with HTTP 200 Status Code
