
require 'mongo_mapper'

class RentalStores
    include MongoMapper::Document

    set_collection_name "rental_stores"

    many :movies
    many :clients
    key :name, String
    timestamps!
    
end