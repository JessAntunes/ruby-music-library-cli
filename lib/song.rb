class Song
    attr_accessor :name, :genre, :artist

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name  
        self.artist=(artist) if artist != nil
        self.genre=(genre) if genre != nil
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end
    
    def save
        @@all << self
    end

    def self.create(name)
        new_song = Song.new(name)
        new_song.save
        new_song
    end

    def self.find_by_name(name)
        self.all.find {|song| song.name == name}
    end
    
    def self.all
        @@all
    end

    def self.destroy_all
        all.clear
    end

    def self.find_or_create_by_name(name)
        if self.find_by_name(name)
            self.find_by_name(name)
        else
            self.create(name)
        end
    end


end