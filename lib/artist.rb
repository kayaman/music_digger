class Artist
  INFO_KINDS = [:albums, :top_tracks, :related_artists]

  def self.disallowed_kind(kins)
    kinds.reject { |kind| allowed_kind?(kind) }
  end

  def self.allowed_kind?(kind)
    INFO_KINDS.include? kind.gsub(' ', '_').to_sym
  end
end
