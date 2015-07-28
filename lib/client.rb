class Client
    attr_accessor :name, :id, :address, :phone
    attr_reader :watchedMovies

    def initialize(name, id, address, phone)
        @name = name
        @id = id
        @address = address
        @phone = phone

        @watchedMovies = Set.new
    end

    def to_s
        @name
    end

    def addWatched(movie, duration)
        watched = Watched.new movie, duration
        @watchedMovies << watched
    end
end