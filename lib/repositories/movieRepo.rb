require 'mongo_mapper'

class MovieRepo
    include MongoMapper::EmbeddedDocument

    key :name, String
    key :genre, String
    key :duration, Integer
    belongs_to :rental
end