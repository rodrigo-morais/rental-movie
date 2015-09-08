require './lib/watched'
require './lib/movie'

describe Watched do
    before do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @watched = Watched.new @movie, 23
    end

    it "to_s method from watched have to return the name of movie and how much was watched" do
        expect(@watched.to_s()).to eq("Back to the future - 23 minutes")
    end
end