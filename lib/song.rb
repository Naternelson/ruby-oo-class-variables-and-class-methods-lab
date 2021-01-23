require 'pry'
class Song

    @@count = 0
    @@artists = []
    @@genres = []

    attr_accessor :name, :artist, :genre
    def initialize(name,artist,genre)
        @name = name
        @artist = artist
        @genre = genre
        @@count += 1
        @@artists << artist
        @@genres << genre
    end

    def self.count
        @@count
    end

    def self.artists
        @@artists.uniq
    end

    def self.genres
        @@genres.uniq
    end

    def self.genre_count
        self.get_count(@@genres)
    end

    def self.artist_count
        self.get_count(@@artists)
    end

    def self.get_count(array)
        #Injecting a counter hash, that counts each song that has that the variable
        hash = array.inject({}) do |counter_hash, element|
            #counter_hash sees if that element has been created yet, if not sets the value to zero
            #if(a) is falsy, then assign b to a
            counter_hash[element] ||= 0 
            #counter_hash then increments that value by one
            counter_hash[element] += 1
            # #Returns counter_hash
            counter_hash
        end
        hash
    end
end
