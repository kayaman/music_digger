intent 'SetInformationKind' do
  artist_name = request.session_attribute('ArtistName')
  information_kind = request.slot_value('InformationKind')

  response_text = [
    "Okay then! You want to know the #{information_kind} for #{artist_name} ",
    "Is that right?"
  ].join

  ask(response_text,
        session_attributes: {
          ArtistName: artist_name,
          InformationKind: information_kind
        }
      )
end
