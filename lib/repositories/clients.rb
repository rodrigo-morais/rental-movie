require 'mongoid'
require './lib/repositories/watcheds'

class Clients
    include Mongoid::Document

    field :name, type: String
    field :address, type: String
    field :phone, type: String
    embeds_many :watched_movies, class_name: "Watcheds"

end