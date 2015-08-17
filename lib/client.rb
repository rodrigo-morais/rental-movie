require './lib/watched'
require 'mongo_mapper'

class Client
    include MongoMapper::EmbeddedDocument

    attr_accessor :name, :id, :address, :phone
    attr_reader :watchedMovies

    key :name, String
    key :address, String
    key :phone, String
    belongs_to :rental

    def initialize(name, address, phone)
        @name = name
        @address = address
        @phone = phone

        @watchedMovies = Set.new
    end

    def to_s
        @name
    end

    def add_watched(movie, duration)
        watched = Watched.new movie, duration
        @watchedMovies << watched
    end
end