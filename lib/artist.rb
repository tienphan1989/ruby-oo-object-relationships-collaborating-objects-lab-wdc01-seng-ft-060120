class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name;
        @@all << self
    end

    def self.all
        @@all
    end
    
    def add_song(song)
        song.artist = self 
    end

    def songs
        Song.all.select { |song_info| song_info.artist == self}
    end

    def self.find_or_create_by_name(name)
        @@all.each do |artist|
            if artist.name == name
              return artist
              break
            end
          end
          new_artist = Artist.new(name)
          return new_artist
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end  
end