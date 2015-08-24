require './lib/watched'

class Client
    attr_accessor :name, :id, :address, :phone
    attr_reader :watchedMovies

    
    def initialize(name, address, phone)
        @name = name
        @address = address
        @phone = phone

        @watchedMovies = Set.new

        @repo = Clients.new(:name => name, :address => address, :phone => phone)
    end

    def to_s
        @name
    end

    def add_watched(movie, duration)
        watched = Watched.new movie, duration
        @watchedMovies << watched
        @repo.watched_movies << watched.get_repository
    end

    def get_repository
        @repo
    end
end