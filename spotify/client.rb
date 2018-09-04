require 'uri'
require 'net/http'
require 'json'
require_relative '../config'

url = URI('https://accounts.spotify.com/api/token'.freeze)
http_basic_auth_token = Config.new.spotify_basic_auth_token

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = 'application/x-www-form-urlencoded'
request["Authorization"] = http_basic_auth_token.strip
request["Cache-Control"] = 'no-cache'
request["Postman-Token"] = 'cab8fb44-bc8a-4a55-99c4-79d86a5ee3cf'
request.body = "grant_type=client_credentials"
response = http.request(request)

p JSON.parse(response.read_body)["access_token"]
