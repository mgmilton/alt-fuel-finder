class TopArtists
def self.create_artists(artists)
  artists.map do |artist|
    new(artist)
  end
end
