require 'mongo_mapper'

class Clients
    include MongoMapper::EmbeddedDocument

    key :name, String
    key :address, String
    key :phone, String
    many :watched_movies
    belongs_to :rental
end