require 'set'
require 'mongo_mapper'

class RentalStore
    include MongoMapper::Document

    attr_accessor :name, :id

    many :movies
    many :clients
    key :name, String
    timestamps!

    def initialize(name)
        @name = name

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

    def get_client(name)
        @clients = @clientList.map do |client|
            if client.name == name
                client
            end
        end

        return @clients.length > 0 ? @clients[0] : nil
    end
end