require './lib/movie'

describe Movie do
    before do
        @movie = Movie.new "Back to the future", 1, "Action", 134
    end

    it "to_s method from movie have to return the name of movie" do
        expect(@movie.to_s()).to have_content("Back to the future")
    end
end