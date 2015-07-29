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
    puts ' 4 - Register movie watched by client'
    puts ' 5 - Show movies registered'
    puts ' 6 - Show clients registered'
    puts ' 7 - Exit'

    print 'Choose an option: '
end

def add_movie
    clear
    
    puts "What's the movies title?"
    @title = gets

    puts "What's the movies genre?"
    @genre = gets

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
    @name = gets

    puts "What's the client's address?"
    @address = gets

    puts "What's the client's phone?"
    @phone = gets

    @client = Client.new @name, 0, @address, @phone
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

main

@option = 0

while @option != 7 do
    @option = gets.to_i

    case @option
        when 1 then add_movie
        when 2 then add_client
        when 5 then show_movies
        when 6 then show_clients
    end
end