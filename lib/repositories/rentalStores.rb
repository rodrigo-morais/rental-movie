require 'mongo_mapper'
require './lib/repositories/clients'
require './lib/repositories/movies'

class RentalStores
    include MongoMapper::Document

    set_collection_name "rental_stores"

    many :clients, :class_name  => "Clients"
    many :movies, :class_name  => "Movies"
    key :name, String
    timestamps!
    
end