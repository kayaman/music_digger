require 'yaml'
require 'base64'


class Config

  def initialize
    @settings = YAML.load(File.read('settings.yml'))
  end

  def spotify_basic_auth_token
    "Basic #{Base64.strict_encode64([ spotify_client_id, spotify_client_secret ].join(':'))}"
  end

  private

  def spotify_client_id
    @settings[:spotify][:client_id].strip
  end

  def spotify_client_secret
    @settings[:spotify][:client_secret].strip
  end
end
