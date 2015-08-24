require 'mongoid'

class Watcheds
    include Mongoid::Document

    field :duration, type: Integer
    belongs_to :movie, class_name: "Movies"
end