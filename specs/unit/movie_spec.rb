require './lib/movie'

describe Movie do
    before do
        @movie = Movie.new 0, "Back to the future", "Action", 134
    end

    it "to_s method from movie have to return the name of movie" do
        expect(@movie.to_s()).to eq("Back to the future")
    end
end