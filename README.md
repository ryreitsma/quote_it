# README 

This is a basic Rails application which shows the best quotes of some of our favorite Dutch football coaches. 

## How to run the app
You need to install sqlite3 on your machine. On Redhat based systems, just run `yum install sqlite-devel`.

The application is developed with Ruby 2.2, so use that. Otherwise, it will probably run on version 1.9 or higher, but I haven't tested it.

To run the app, first install the bundle,  create the database and seed it:
```
bundle
bin/rake db:create db:schema:load db:seed
```

Then run the rails app(`bin/rails s`) and visit http://lvh.me:3000

Want to add some quotes? Visit http://lvh.me:3000/quotes


## Running the specs
The project contains some Capybara feature specs. It uses selenium-webdriver by default, so you need to have Firefox installed.
First create the test database: `bundle exec rake db:test:prepare`. 
Then run the specs `bundle exec rspec spec/features`


Enjoy!
