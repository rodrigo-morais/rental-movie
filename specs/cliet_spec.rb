require './lib/client'
require './lib/watched'
require './lib/movie'

describe Client do
    before do
        @client = Client.new "Rodrigo Morais", "24th October Street", "5136845328"
    end

    it "to_s method from client have to return the name of client" do
        expect(@client.to_s()).to eq("Rodrigo Morais")
    end

    it "verify if the watched movies list start without movies" do
        expect(@client.watchedMovies.length).to eq(0)
    end

    it "add a new watched movie in the list of watched movies" do
        @movie = Movie.new "Back to the future", "Action", 134

        @client.add_watched @movie, 23

        expect(@client.watchedMovies.length).to eq(1)
    end
end