# About

Sample app built in Vapor

## Put a key into cache

### REST command

`GET /touch/<key>`

### Response

HTTP Status 200 is returned along with empty body

## Get active keys size

### REST command

`GET /count`

### Response

JSON object is returned with a single property `count`

```json
{
  "count": 10
}
```
