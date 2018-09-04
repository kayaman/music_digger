intent 'StartArtistSearch' do
  artist_name = request.slot_value('ArtistName')

  # TODO: Spotify search for artist by name

  response_text = [
    "Okay then! I see #{artist_name} is about rock and roll! ",
    "What kind of information would you like?"
  ].join

  ask(response_text, session_attributes: { ArtistName: artist_name })
end
