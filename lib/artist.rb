class Artist 
    extend Concerns::Findable
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
    end

    def songs
        Song.all.select {|song| song.artist == self}       
    end

    def genres
        unique_genres = []
        Song.all.select do |song| 
            if song.artist == self
                unique_genres << song.genre
            end
        end 
        unique_genres.uniq     
    end

    def add_song(song)
        if song.artist == nil
            song.artist = self
        end
    end


    def save
        @@all << self
    end

    def self.create(name)
        new_artist = Artist.new(name)
        new_artist.save
        new_artist
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        if self.all.find { |artist| artist.name == name}
            self.all.find { |artist| artist.name == name}
        else
            self.create(name)
        end
    end

    def self.destroy_all
        all.clear
    end



end