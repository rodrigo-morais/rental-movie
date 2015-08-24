require './lib/repositories/watcheds'

class Watched
    attr_accessor :movie, :duration

    def initialize(movie, duration)
        @movie = movie
        @duration = duration

        @repo = Watcheds.new(:movie => movie.get_repository, :duration => duration)
    end

    def to_s
        @movie.to_s.gsub(/\n/," ") + " - " + @duration.to_s + " minutes"
    end

    def get_repository
        @repo
    end
end