require 'mongoid'
require './lib/repositories/clients'
require './lib/repositories/movies'

class RentalStores
    include Mongoid::Document
    include Mongoid::Timestamps

    store_in collection: "rental_stores"

    has_many :clients, class_name: "Clients"
    has_many :movies, class_name: "Movies"
    field :name, type: String
    
end