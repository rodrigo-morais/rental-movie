require 'mongoid'

class Movies
    include Mongoid::Document

    field :name, type: String
    field :genre, type: String
    field :duration, type: Integer
    embedded_in :rentalStore

end