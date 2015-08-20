require 'mongo_mapper'
require './lib/repositories/watcheds'

class Clients
    include MongoMapper::EmbeddedDocument

    key :name, String
    key :address, String
    key :phone, String
    many :watched_movies, :class_name  => "Watcheds"

end