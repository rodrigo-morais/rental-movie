require 'set'
require './lib/repositories/rentalStores'

class RentalStore
    attr_accessor :name, :id

    def initialize(name)
        @name = name

        @movieList = Set.new
        @clientList = Set.new

        @repo = RentalStores.new name
        
        @repo.get_clients.each do |client|
            newClient = Client.new client[:name], client[:address], client[:phone]

            #client[:watched_movies].each do |watched|
            #    newMovie = Movie.new watched[:name], watched[:genre], watched[:duration]
            #        newClient.add_watched newMovie, watched.duration
            #    end
            #end

            @clientList << newClient
        end

        @repo.get_movies.each do |movie|
            newMovie = Movie.new movie[:name], movie[:genre], movie[:duration]
            @movieList << newMovie
        end
    end

    def movies
        @movieList
    end

    def clients
        @clientList
    end

    def add_movie(movie)
        @movieList << movie
        @repo.add_movie movie
    end

    def add_client(client)
        @clientList << client
        @repo.add_client client
    end

    def get_movie(name)
        @movies = @movieList.map do |movie|
            if movie.name == name
                movie
            end
        end

        return @movies.length > 0 ? @movies[0] : nil
    end

    def get_client(name)
        @clients = @clientList.map do |client|
            if client.name == name
                client
            end
        end

        return @clients.length > 0 ? @clients[0] : nil
    end

end