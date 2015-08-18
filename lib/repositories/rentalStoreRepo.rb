require 'mongo_mapper'

class RentalStoreRepo
    include MongoMapper::Document

    set_collection_name "rental_stores"

    many :movies
    many :clients
    key :name, String
    timestamps!
    
end