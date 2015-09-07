class Movie
    attr_accessor :id, :name, :genre, :duration

    def initialize(id, name, genre, duration)
        @id = id
        @name = name
        @genre = genre
        @duration = duration
    end

    def to_s
        @name
    end
end