require 'set'
require './lib/repositories/rentalStores'

class RentalStore
    attr_accessor :name, :id

    def initialize(name)
        @name = name

        @movieList = Set.new
        @clientList = Set.new

        @repo = RentalStores.where(:name => name).first

        if @repo == nil
            @repo = RentalStores.new(:name => name)
            save
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

    def get_client(name)
        @clients = @clientList.map do |client|
            if client.name == name
                client
            end
        end

        return @clients.length > 0 ? @clients[0] : nil
    end

    def save
        @repo.save!
    end

end