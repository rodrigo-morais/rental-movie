require 'set'

class RentalStore
    attr_accessor :name, :id

    def initialize(name, id)
        @name = name
        @id = id

        @movieList = Set.new
    end

    def movies
        @movieList
    end
end