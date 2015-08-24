require 'mongo_mapper'

class Watcheds
    include MongoMapper::EmbeddedDocument

    key :duration, Integer
    belongs_to :movie
end