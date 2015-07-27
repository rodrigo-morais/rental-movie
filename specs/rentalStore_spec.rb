require './lib/rentalStore'
require './lib/movie'

describe RentalStore do
    before do
        @rentalStore = RentalStore.new "Maluju", 1
    end

    it "the rental store with no movies regtistered have to return none movie in the movie list" do
        expect(@rentalStore.movies.length).to eq(0)
    end

    it "the rental store with no clients regtistered have to return none client in the client list" do
        expect(@rentalStore.clients.length).to eq(0)
    end

    it "the rental store have to have a movie in its movie list after one movie was registered" do
        @movie = Movie.new "Back to the future", 1, "Action", 134
        @rentalStore.add_movie(@movie)

        expect(@rentalStore.movies.length).to eq(1)
    end

    it "the rental store have to have a client in its client list after one client was registered" do
        @client = Client.new "Rodrigo Morais", 1, "24th October Street", "5136845328"
        @rentalStore.add_client(@client)

        expect(@rentalStore.clients.length).to eq(1)
    end
end