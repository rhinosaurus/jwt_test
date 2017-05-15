# Simple JWT Example

This is an example of using JWT for authorization.

You can read more about how JWTs work at https://jwt.io/

To get started here you'll need to do a few things:
 * Run bundle install
 * Run rake db:create
 * Add some dummy data via rails console User.create!(email: 'example@mail.com' , password: '123123123' , password_confirmation: '123123123')
 * Install Postman from https://www.getpostman.com/

Testing It:
 * Now open Postman and select POST and put in the URL http://localhost:3000/authenticate
 * Under "Body" put in {"email":"example@mail.com","password":"123123123"} and select "raw" and change "Text" to "JSON application/json"
 * Hit send, you should be returned something that looks like { "auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHBpcmVzIjoxNDg4OTA3ODAyfQ.agbESasxboEyigSWoOY6AklkAhV9Sm-PlI7wNvDkcCA" }
 * Copy the token in auth_token, now make a new tab in Postman and select GET
 * Put in the URL http://localhost:3000/items
 * Under "Headers" add a new line, the key will be Authorization and the value will be the token you copied
 * Hit send and you should be returne an empty array implying a successful token
 * Try removing the token or replacing it with garbage text and run the request again, you should see the authorization failed
