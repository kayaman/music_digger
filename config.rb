require 'yaml'
require 'base64'


class Config

  def initialize
    @settings = YAML.load(File.read('settings.yml'))
  end

  def spotify_client_id
    @settings[:spotify][:client_id].strip
  end

  def spotify_client_secret
    @settings[:spotify][:client_secret].strip
  end
end
