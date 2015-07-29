require './lib/rentalStore'
require './lib/movie'
require './lib/client'

@rentalStore = RentalStore.new "Malaju", 0

def clear
    puts "\e[H\e[2J"
end

def main
    clear
    
    puts 'Menu'
    puts ' 1 - Register movie'
    puts ' 2 - Register client'
    puts ' 3 - Register movie watched by client'
    puts ' 4 - Register movie watched by client'
    puts ' 5 - Show movies registered'
    puts ' 6 - Exit'

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

puts 'Rental Store'
puts ''


main

@option = 0

while @option != 6 do
    @option = gets.to_i

    case @option
        when 1 then add_movie
        when 5 then show_movies
    end
end