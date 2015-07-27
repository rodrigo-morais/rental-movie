require './lib/client'

describe Client do
    before do
        @client = Client.new "Rodrigo Morais", 1, "24th October Street", "5136845328"
    end

    it "to_s method from client have to return the name of client" do
        expect(@client.to_s()).to eq("Rodrigo Morais")
    end
end