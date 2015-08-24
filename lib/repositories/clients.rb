require 'mongoid'
require './lib/repositories/watcheds'

class Clients
    include Mongoid::Document

    field :name, type: String
    field :address, type: String
    field :phone, type: String
    has_many :watched_movies

end