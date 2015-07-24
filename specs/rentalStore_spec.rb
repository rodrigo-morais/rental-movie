require './lib/rentalStore'

describe RentalStore do
    before do
        @rentalStore = RentalStore.new "Maluju", 1
    end

    it "the rental store with no movies regtistered have to return none movie in the movie list" do
        expect(@rentalStore.movies.length).to eq(0)
    end
end