require './lib/rentalStore'
require './lib/movie'
require './lib/repositories/rentalStores'

describe RentalStore do
    before do
        repo = double(:rentalStores)
        allow(repo).to receive(:get_movies).and_return([])
        allow(repo).to receive(:get_clients).and_return([])
        allow(repo).to receive(:add_movie)
        allow(repo).to receive(:add_client)
        @rentalStore = RentalStore.new "Maluju", repo
    end

    it "the rental store with no movies regtistered have to return none movie in the movie list" do
        expect(@rentalStore.movies.length).to eq(0)
    end

    it "the rental store with no clients regtistered have to return none client in the client list" do
        expect(@rentalStore.clients.length).to eq(0)
    end

    it "the rental store have to have a movie in its movie list after one movie was registered" do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @rentalStore.add_movie(@movie)

        expect(@rentalStore.movies.length).to eq(1)
    end

    it "the rental store have to have a client in its client list after one client was registered" do
        @client = Client.new 0, "Rodrigo Morais", "October 24th Street", "5136845328"
        @rentalStore.add_client(@client)

        expect(@rentalStore.clients.length).to eq(1)
    end

    it "should return a movie from movies list using the name to looking for it" do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @rentalStore.add_movie(@movie)

        expect(@rentalStore.get_movie_by_name("Back to the future")).to be_an_instance_of Movie
    end

    it "should return nil from movies list using the name to looking for it when the movie doesn't exist in the list" do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @rentalStore.add_movie(@movie)

        expect(@rentalStore.get_movie_by_name("Back to the past")).to be nil
    end

    it "should return a client from clients list using the name to looking for it" do
        @client = Client.new 0, "Rodrigo Morais", "24th October Street", "5136845328"
        @rentalStore.add_client(@client)

        expect(@rentalStore.get_client("Rodrigo Morais")).to be_an_instance_of Client
    end

    it "should return nil from clients list using the name to looking for it when the client doesn't exist in the list" do
        @client = Client.new 0, "Rodrigo Morais", "24th October Street", "5136845328"
        @rentalStore.add_client(@client)

        expect(@rentalStore.get_client("Ana Paula")).to be nil
    end
end