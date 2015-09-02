require 'mongo'
require './lib/repositories/clients'
require './lib/repositories/movies'

class RentalStores
    
    def initialize(name)
        Mongo::Logger.logger.level = ::Logger::FATAL

        @db = Mongo::Client.new([ 'RODRIGO-UBUNTU' ], :database => 'rental-store')
        
        @name = name

        get name
    end

    def get(name)
        coll = @db[:rental_stores].find(:name => name).first

        if(coll == nil)
            coll = @db[:rental_stores].insert_one({
                :name => name,
                :movies => [],
                :clients => []
            })
        end
    end

    def add_movie(movie)
        if exist_movie(movie.name) == false
            rental = @db[:rental_stores]
            rental.find(name: @name)
                .update_one({
                    "$push" => { 
                        movies: {
                            :_id => rental.find(name: @name).first[:movies].count,
                            :name => movie.name,
                            :genre => movie.genre,
                            :duration => movie.duration
                        }
                    }
                })
        end
    end

    def add_client(client)
        rental = @db[:rental_stores]

        rental.find(name: @name)
            .update_one({
                "$push" => { 
                    clients: {
                        :_id => rental.find(name: @name).first[:clients].count,
                        :name => client.name,
                        :address => client.address,
                        :phone => client.phone,
                        :watched_movies => []
                    }
                }
            })
    end

    def get_clients
        rental = @db[:rental_stores]
        rental.find(:name => @name).first[:clients]
    end

    def get_movies
        rental = @db[:rental_stores]
        rental.find(:name => @name).first[:movies]
    end

    private

    def exist_movie(name)
        rental = @db[:rental_stores]
        movies = rental.find(name: @name).first[:movies]
        movies.select{|movie| movie[:name] == name}.count > 0
    end
    
end