require 'set'

class RentalStore
    attr_accessor :name, :id

    def initialize(name, id)
        @name = name
        @id = id

        @movieList = Set.new
    end

    def movies
        @movieList
    end

    def add_movie(movie)
        @movieList << movie
    end
end