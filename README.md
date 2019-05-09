# URL SHORTENER API

## POST /login

Authentication

### Params

- email
- password

## POST /links

Create a shortened link

** This is a authenticated route, send the header Authorization **

### Params

- original_url (required)  | type: STRING
- shortened_url (optional) | type: STRING
- expires_at (optional)    | type: INTEGER



