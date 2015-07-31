require 'set'

class RentalStore
    attr_accessor :name, :id

    def initialize(name, id)
        @name = name
        @id = id

        @movieList = Set.new
        @clientList = Set.new
    end

    def movies
        @movieList
    end

    def clients
        @clientList
    end

    def add_movie(movie)
        @movieList << movie
    end

    def add_client(client)
        @clientList << client
    end

    def get_movie(name)
        @movies = @movieList.map do |movie|
            if movie.name == name
                movie
            end
        end

        return @movies.length > 0 ? @movies[0] : nil
    end
end