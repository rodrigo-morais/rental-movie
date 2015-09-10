require './lib/rentalStore'
require './lib/movie'
require './lib/repositories/rentalStores'

describe RentalStore do
    before do
        @repo = RentalStores.new 'Vivivideo', 'rental_store_2'
        @rentalStore = RentalStore.new "Vivivideo", @repo
    end

    after do
        @repo.drop
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

    it "the rental store with two movies in its movie list, when movie is looking for by name it has to be presented" do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @rentalStore.add_movie(@movie)

        @movie = Movie.new 1, "Lord of Rings", "Fantasy", 528
        @rentalStore.add_movie(@movie)

        expect(@rentalStore.get_movie_by_name("Back to the future").name).to eq("Back to the future")
    end

    it "the rental store with two movies in its movie list, when movie is looking for by name which doesn't exist it has to be nil" do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @rentalStore.add_movie(@movie)

        @movie = Movie.new 1, "Lord of Rings", "Fantasy", 528
        @rentalStore.add_movie(@movie)

        expect(@rentalStore.get_movie_by_name("Catch me if you can")).to be_nil
    end

    it "the rental store with two movies in its movie list, when verify if movie exists it has to be true" do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @rentalStore.add_movie(@movie)

        @movie = Movie.new 1, "Lord of Rings", "Fantasy", 528
        @rentalStore.add_movie(@movie)

        expect(@rentalStore.exist_movie?("Lord of Rings")).to be true
    end

    it "the rental store with two movies in its movie list, when verify if movie exists, and it doesn't, it has to be false" do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @rentalStore.add_movie(@movie)

        @movie = Movie.new 1, "Lord of Rings", "Fantasy", 528
        @rentalStore.add_movie(@movie)

        expect(@rentalStore.exist_movie?("Catch me if you can")).to be false
    end

    it "the rental store with two movies in its movie list, when movie is looking for by id it has to be presented" do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @rentalStore.add_movie(@movie)

        @movie = Movie.new 1, "Lord of Rings", "Fantasy", 528
        @rentalStore.add_movie(@movie)

        expect(@rentalStore.get_movie_by_id(1).name).to eq("Lord of Rings")
    end

    it "the rental store with two movies in its movie list, when movie is looking for by id which doesn't exist it has to be nil" do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @rentalStore.add_movie(@movie)

        @movie = Movie.new 1, "Lord of Rings", "Fantasy", 528
        @rentalStore.add_movie(@movie)

        expect(@rentalStore.get_movie_by_id(3)).to be_nil
    end

    it "the rental store with two movies in its movie list, verify if duration of a specif movie is valid. The duration passed is smaller than the dration of movie and the return have to be true" do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @rentalStore.add_movie(@movie)

        @movie = Movie.new 1, "Lord of Rings", "Fantasy", 528
        @rentalStore.add_movie(@movie)

        expect(@rentalStore.movie_duration_valid?("Back to the future", 55)).to be true
    end

    it "the rental store with two movies in its movie list, verify if duration of a specif movie is valid. The duration passed is equal than the dration of movie and the return have to be true" do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @rentalStore.add_movie(@movie)

        @movie = Movie.new 1, "Lord of Rings", "Fantasy", 528
        @rentalStore.add_movie(@movie)

        expect(@rentalStore.movie_duration_valid?("Back to the future", 134)).to be true
    end

    it "the rental store with two movies in its movie list, verify if duration of a specif movie is valid. The duration passed is bigger than the dration of movie and the return have to be false" do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @rentalStore.add_movie(@movie)

        @movie = Movie.new 1, "Lord of Rings", "Fantasy", 528
        @rentalStore.add_movie(@movie)

        expect(@rentalStore.movie_duration_valid?("Back to the future", 135)).to be false
    end

    it "the rental store with two movies in its movie list, verify if duration of a movie which doesn't exist. The return have to be false" do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @rentalStore.add_movie(@movie)

        @movie = Movie.new 1, "Lord of Rings", "Fantasy", 528
        @rentalStore.add_movie(@movie)

        expect(@rentalStore.movie_duration_valid?("First Love", 5)).to be false
    end

    it "the rental store have to have a client in its client list after one client was registered" do
        @client = Client.new 0, "Rodrigo Morais", "October 24th Street", "5136845328"
        @rentalStore.add_client(@client)

        expect(@rentalStore.clients.length).to eq(1)
    end

    it "the rental store with two clients in its client list, when a client is looking for by name it has to be presented" do
        @client = Client.new 0, "Rodrigo Morais", "October 24th Street", "5136845328"
        @rentalStore.add_client(@client)

        @client = Client.new 1, "Kathi", "Germany", "884566996666"
        @rentalStore.add_client(@client)

        expect(@rentalStore.get_client("Kathi").name).to eq("Kathi")
    end

    it "the rental store with two clients in its client list, verify if a existent client exist. The return have to be true" do
        @client = Client.new 0, "Rodrigo Morais", "October 24th Street", "5136845328"
        @rentalStore.add_client(@client)

        @client = Client.new 1, "Kathi", "Germany", "884566996666"
        @rentalStore.add_client(@client)

        expect(@rentalStore.exist_client?("Kathi")).to be true
    end

    it "the rental store with two clients in its client list, verify if a doesn't existent client exist. The return have to be false" do
        @client = Client.new 0, "Rodrigo Morais", "October 24th Street", "5136845328"
        @rentalStore.add_client(@client)

        @client = Client.new 1, "Kathi", "Germany", "884566996666"
        @rentalStore.add_client(@client)

        expect(@rentalStore.exist_client?("Carol")).to be false
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

    it "shouldn't return any watched movie from a new client" do
        @client = Client.new 0, "Rodrigo Morais", "24th October Street", "5136845328"
        @rentalStore.add_client(@client)

        expect(@client.watchedMovies.length).to be(0)
    end

    it "should return one movie after add a watched movie to a client" do
        @movie = Movie.new 0, "Back to the future", "Action", 134
        @rentalStore.add_movie(@movie)

        @client = Client.new 0, "Rodrigo Morais", "24th October Street", "5136845328"
        @rentalStore.add_client(@client)

        @rentalStore.watch_movie("Rodrigo Morais", "Back to the future", 33)

        expect(@client.watchedMovies.length).to be(1)
    end
end