require 'mongo'

class RentalStores
    
    def initialize(name, database='rental-store')
        Mongo::Logger.logger.level = ::Logger::FATAL

        @db = Mongo::Client.new([ 'RODRIGO-UBUNTU' ], :database => database)
        
        @rental = @db[:rental_stores]

        @name = name

        get name
    end

    def get(name)
        coll = @rental.find(:name => name).first

        if(coll == nil)
            coll = @rental.insert_one({
                :name => name,
                :movies => [],
                :clients => []
            })
        end
    end

    def add_movie(movie)
        if exist_movie(movie.name) == false
            @rental.find(name: @name)
                .update_one({
                    "$push" => { 
                        movies: {
                            :_id => @rental.find(name: @name).first[:movies].count,
                            :name => movie.name,
                            :genre => movie.genre,
                            :duration => movie.duration
                        }
                    }
                })
        end
    end

    def add_client(client)
        if exist_client(client.name) == false
            @rental.find(name: @name)
                .update_one({
                    "$push" => { 
                        clients: {
                            :_id => @rental.find(name: @name).first[:clients].count,
                            :name => client.name,
                            :address => client.address,
                            :phone => client.phone,
                            :watched_movies => []
                        }
                    }
                })
        end
    end

    def get_clients
        @rental.find(:name => @name).first[:clients]
    end

    def get_movies
        @rental.find(:name => @name).first[:movies]
    end

    def add_watched_movie(client)
        @rental.find(name: @name, 'clients._id': client.id)
            .update_one({
                "$push" => { 
                    'clients.$.watched_movies': {
                        :movie_id => client.watchedMovies.to_a.last.movie.id,
                        :duration => client.watchedMovies.to_a.last.duration
                    }
                }
            })
    end

    def drop
        @db.database.drop
    end

    private

    def exist_movie(name)
        movies = @rental.find(name: @name).first[:movies]
        movies.select{|movie| movie[:name] == name}.count > 0
    end

    def exist_client(name)
        clients = @rental.find(name: @name).first[:clients]
        clients.select{|client| client[:name] == name}.count > 0
    end
    
end