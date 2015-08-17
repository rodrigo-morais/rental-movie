require 'mongo_mapper'

class Movie
    include MongoMapper::EmbeddedDocument

    attr_accessor :name, :genre, :duration

    key :name, String
    key :genre, String
    key :duration, Integer
    belongs_to :rental

    def initialize(name, genre, duration)
        @name = name
        @genre = genre
        @duration = duration
    end

    def to_s
        @name
    end
end