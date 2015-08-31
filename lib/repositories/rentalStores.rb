require 'mongo'
require './lib/repositories/clients'
require './lib/repositories/movies'

class RentalStores
    
    def initialize
        @db = Mongo::Client.new([ 'RODRIGO-UBUNTU' ], :database => 'rental-store')
        @coll
    end

    def get(name)
        @coll = @db[:rental_stores].find(:name => name).first

        if(@coll == nil)
            @coll = @db[:rental_stores].insert_one({
                :name => name
            })
        end

        @coll
    end

    def get_clients
        @coll[:clients] || []
    end

    def get_movies
        @coll[:clients] || []
    end
    
end