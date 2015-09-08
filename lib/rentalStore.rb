require 'set'
require './lib/repositories/rentalStores'

class RentalStore
    attr_accessor :name, :id

    def initialize(name, repo)
        @name = name

        @movieList = Set.new
        @clientList = Set.new

        @repo = repo

        @repo.get_movies.each do |movie|
            newMovie = Movie.new movie[:_id], movie[:name], movie[:genre], movie[:duration]
            @movieList << newMovie
        end
        
        @repo.get_clients.each do |client|
            newClient = Client.new client[:_id], client[:name], client[:address], client[:phone]

            client[:watched_movies].each do |watched|
                newMovie = get_movie_by_id(watched[:movie_id])
                newClient.add_watched newMovie, watched[:duration]
            end

            @clientList << newClient
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

    def get_movie_by_name(name)
        movies =  @movieList.map do |movie|
            if movie.name == name
                movie
            end
        end.select do |movie|
            movie != nil
        end
        
        return movies.length > 0 ? movies[0] : nil
    end

    def get_movie_by_id(id)
        movies =  @movieList.map do |movie|
            if movie.id == id
                movie
            end
        end.select do |movie|
            movie != nil
        end
        
        return movies.length > 0 ? movies[0] : nil
    end

    def get_client(name)
        clients = @clientList.map do |client|
            if client.name == name
                client
            end
        end.select do |client|
            client != nil
        end

        return clients.length > 0 ? clients[0] : nil
    end

    def exist_client?(name)
        @clientList.select{
            |client|
            client.name == name
        }.count > 0
    end

    def exist_movie?(name)
        @movieList.select{
            |movie|
            movie.name == name
        }.count > 0
    end

    def movie_duration_valid?(name, duration)
        movie = get_movie_by_name(name)

        if movie == nil
            false
        elsif movie.duration >= duration
            true
        else
            false
        end
    end

    def watch_movie(client_name, movie_name, duration)
        client = get_client(client_name)

        movie = get_movie_by_name(movie_name)

        client.add_watched movie, duration
        @repo.add_watched_movie client
    end

end