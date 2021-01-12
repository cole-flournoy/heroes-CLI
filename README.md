# Heroes

Welcome! This is a Ruby CLI application that pulls information from the Superhero API at 'https://superheroapi.com/index.html' to get details about characters from a variety of universes, compare their stats in a fight, etc. This is a student project for Flatiron School, so any comments or imporovements are more than welcome.

Ever wonder whether Harry Potter could take Spiderman in a fight? Let's find out! 

## Installation

1. Visit the [Superhero API](https://superheroapi.com/index.html) and log in to Facebook to get your authentication token
2. Clone or copy this repo
3. Create a .env file in the project directory
    3a. The file can be named anything you like
    3b. Inside this file, define a variable called TOKEN equal to your authentication token *as a string*
        ex. TOKEN = "123456789..."
    3c. This variable is called in lib/search.rb
4. While in the project directory, 'bundle install' in your terminal 

## Usage



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/heroes.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
