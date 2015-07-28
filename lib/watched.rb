class Watched
    attr_accessor :movie, :duration

    def initialize(movie, duration)
        @movie = movie
        @duration = duration
    end

    def to_s
        @movie.to_s + ' - ' + @duration.to_s
    end
end