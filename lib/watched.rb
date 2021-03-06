class Watched
    attr_accessor :movie, :duration

    def initialize(movie, duration)
        @movie = movie
        @duration = duration
    end

    def to_s
        @movie.to_s.gsub(/\n/," ") + " - " + @duration.to_s + " minutes"
    end
end