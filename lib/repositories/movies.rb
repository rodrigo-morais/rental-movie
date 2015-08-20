require 'mongo_mapper'

class Movies
    include MongoMapper::EmbeddedDocument

    key :name, String
    key :genre, String
    key :duration, Integer

end