require 'mongo_mapper'

class WatchedRepo
    include MongoMapper::EmbeddedDocument

    key :duration, Integer
    belongs_to :client
    belongs_to :movie
end