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

        @repo.clients.each do |client|
            newClient = Client.new client.name, client.address, client.phone

            client.watched_movies.each do |watched|
                movie = @repo.movies.select{ |movie| movie.id == watched.movie_id }
                
                if movie.empty? == false
                    movie = movie[0]
                    newMovie = Movie.new movie.name, movie.genre, movie.duration

                    newClient.add_watched newMovie, watched.duration
                end
            end

            @clientList << newClient
        end

        @repo.movies.each do |movie|
            newMovie = Movie.new movie.name, movie.genre, movie.duration
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
        @repo.movies << movie.get_repository
        save
    end

    def add_client(client)
        @clientList << client
        @repo.clients << client.get_repository
        save
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