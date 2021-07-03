# Heroes

Welcome! This is a Ruby CLI application that pulls information from the Superhero API at 'https://superheroapi.com/index.html' to get details about characters from a variety of universes, compare their stats in a fight, etc. This is a student project for Flatiron School, so any comments or imporovements are more than welcome.

Ever wonder whether Harry Potter could take Spiderman in a fight? Let's find out! 

If you'd like to see a demo for this project, click [here](https://youtu.be/spwgn-CZbBY) for a video walk-through

## Installation

1. Visit the [Superhero API](https://superheroapi.com/index.html) and log in to Facebook to get your authentication token
2. Clone or copy this repo
3. Create a `.env` file in the project directory
    3a. The file actually needs to be *called* `.env` (nothing before the extension) 
    3b. Inside this file, define a variable called TOKEN equal to your authentication token *as a string*
        ex. TOKEN = "123456789..."
    3c. This variable is called in `lib/search.rb`
4. While in the project directory, type `bundle install` in your terminal 

## Usage

1. To run the application, type `bin/heroes` in your terminal
    1a. If you recieve an error about executing the file, you will need to allow read/write privileges by typing `chmod +x bin/heroes`
2. You should be good to go from there! You will be prompted with a Menu of options. You may want to select 'help' the first time to see more detail on the Menu commands. 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cole-flournoy/heroes-CLI.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
