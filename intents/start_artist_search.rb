require 'humanize'
require File.expand_path('../spotify', __FILE__)

intent 'StartArtistSearch' do
  artist_name = request.slot_value('ArtistName')

  artist = Spotify.new.search(artist_name)

  response_text = [
    "Okay then! I see #{artist[:name]} is about #{artist[:genre]}! ",
    "#{artist[:name]} has #{artist[:followers].to_i.humanize} followers on Spotify. ",
    "What else would you like to know?"
  ].join

  ask(response_text,
      session_attributes:
        {
          ArtistName: artist_name,
          ArtistId: artist[:id]
        }
      )
end
