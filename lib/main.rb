require './lib/rentalStore'
require './lib/movie'
require './lib/client'

@rentalStore = RentalStore.new "Malaju", 0

def clear
    puts "\e[H\e[2J"
end

def main
    clear

    puts 'Rental Store'
    puts ''
    
    puts 'Menu'
    puts ' 1 - Register movie'
    puts ' 2 - Register client'
    puts ' 3 - Register movie watched by client'
    puts ' 4 - Show movies registered'
    puts ' 5 - Show clients registered'
    puts ' 6 - Add a movie as watched in client list'
    puts ' 7 - Show watched by client'
    puts ' 8 - Exit'

    print 'Choose an option: '
end

def add_movie
    clear
    
    puts "What's the movies title?"
    @title = gets.chomp 

    puts "What's the movies genre?"
    @genre = gets.chomp 

    puts "What's the movies duration?"
    @duration = gets.to_i

    @movie = Movie.new @title, 0, @genre, @duration
    @rentalStore.add_movie @movie

    main
end

def show_movies
    clear
    
    puts "Movies"
    @rentalStore.movies.each do |movie|
        puts " " + movie.to_s
    end

    puts ""
    puts "Press any key to return"
    gets

    main
end

def add_client
    clear
    
    puts "What's the client's name?"
    @name = gets.chomp 

    puts "What's the client's address?"
    @address = gets.chomp 

    puts "What's the client's phone?"
    @phone = gets

    @client = Client.new @name, 0, @address.gsub(/\n/," "), @phone.gsub(/\n/," ")
    @rentalStore.add_client @client

    main
end

def show_clients
    clear
    
    puts "Clients"
    @rentalStore.clients.each do |client|
        puts " " + client.to_s
    end

    puts ""
    puts "Press any key to return"
    gets

    main
end

def add_watched
    clear

    puts "What's the client's name?"
    @name = gets.chomp 

    @clients = @rentalStore.clients.select{
        |client|
        client.name == @name
    }

    if @clients.empty?
        clear

        puts "Doesn't exist a client with name is " + @name
        gets
        main

        return
    end
    
    puts "What's the movie's name?"
    @name = gets.chomp 

    @movies = @rentalStore.movies.select{
        |movie|
        movie.name == @name
    }

    if @movies.empty?
        clear

        puts "Doesn't exist a movie with name is " + @name
        gets
        main

        return
    end

    puts "What's the movie's duration?"
    @duration = gets.to_i

    if @duration > @movies[0].duration
        @duration = @movies[0].duration
    end

    @clients[0].add_watched @movies[0], @duration

    main
end

def show_watched
    clear
    
    puts "Movies watched by client"
    puts " "
    @rentalStore.clients.each do |client|
        puts " Client: " + client.to_s
        client.watchedMovies.each do |watched|
            @desc = 'Movie: ' + watched.to_s
            puts '    ' + @desc
        end
    end

    puts ""
    puts "Press any key to return"
    gets

    main
end

main

@option = 0

while @option != 8 do
    @option = gets.to_i

    case @option
        when 1 then add_movie
        when 2 then add_client
        when 4 then show_movies
        when 5 then show_clients
        when 6 then add_watched
        when 7 then show_watched
    end
end