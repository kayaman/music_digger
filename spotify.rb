require 'uri'
require 'faraday'
require 'json'
require_relative './config'

class Spotify

  def search(query)
    url = 'https://api.spotify.com/v1/search'
    connection = Faraday.new(url: url) do |faraday|
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
    response = connection.get do |request|
      request.headers['Accept'] = 'application/json'
      request.headers['Authorization'] = "Bearer #{access_token}"
      request.params['q'] = query
      request.params['type'] = 'artist'
      request.params['limit'] = 1
      request.params['offset'] = 0
    end
    parsed_response = JSON.parse(response.body)['artists']['items'][0]
    {
      id: parsed_response['id'],
      name: parsed_response['name'],
      genre: parsed_response['genres'][0],
      followers: parsed_response['followers']['total']
    }
  end

  def albums(artist_id)

  end

  def top_tracks(artist_id)

  end

  def related_artists(artist_id)

  end

  private

  def access_token
    url = 'https://accounts.spotify.com/api/token'
    connection = Faraday.new(url: url) do |faraday|
      faraday.basic_auth(config.spotify_client_id, config.spotify_client_secret)
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
    response = connection.post do |request|
      request.headers['Accept'] = 'application/json'
      request.headers['Cache-Control'] = 'no-cache'
      request.body = 'grant_type=client_credentials'
    end
    JSON.parse(response.body)['access_token']
  end

  def config
    Config.new
  end
end
