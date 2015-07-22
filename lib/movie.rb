class Movie
    attr_accessor :name, :id, :genre, :duration

    def initialize(name, id, genre, duration)
        @name = name
        @id = id
        @genre = genre
        @duration = duration
    end

    def to_s
        @name
    end
end