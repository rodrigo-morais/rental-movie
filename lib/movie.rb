require './lib/repositories/movies'

class Movie
    attr_accessor :name, :genre, :duration

    def initialize(name, genre, duration)
        @name = name
        @genre = genre
        @duration = duration

        @repo = Movies.new(:name => name, :genre => genre, :duration => duration)
    end

    def to_s
        @name
    end
end