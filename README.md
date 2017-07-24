# Local Business Lookup API

#### _June 21th, 2017_

#### By _**Ken Rutan**_

## Overview

This website is an API which allows users to look up various local businesses and associated reviews of those businesses.  It is built on Ruby-On-Rails, which allows for full CRUD functionality through the API.  The API outputs data in the form of a JSON file.


## Objective

The objective of this project was to create a functional and user friendly back-end API which displays data to the user in JSON format, which will allow it to be interpreted by another program.

## Specifications

| behavior |  input   |  output  |
|----------|:--------:|:--------:|
|Allow the user enter a url and view a readout of all local businesses. | "localhost:3000/shops" | *List out a JSON containing data on all available shops* |
|Allow the user to enter a URL corresponding to a specific business id and view a JSON containing data only on that specific business.  |  "localhost:3000/shops/1" | *Displays a JSON containing data only on that specific shop.* |
|Allow the user to enter a url corresponding to the random route to display a random business. | "localhost:3000/random" | *List out a JSON corresponding to a random business.* |
|Allow the user to enter a route which will allow them to see all of the reviews on a specific business. | "localhost:3000/shops/1/reviews" | *Display a list of all of the reviews attached to that specific business* |
|Allow the user to enter a url corresponding to a specific page, which will then paginate the JSON outputs to a specific number per page, then display them | "localhost:3000/shops?page=2" | *displays page 2 of the results to the user.* |


## Usage

Clone or download the repository, navigate into the repository and run "bundle install" from there run postgress from the terminal by running "postgres" in the command line.  Once postgres is running, run "rails db: create" then "rails db:migrate" in the command line to create the required databases.  You may also run "rails db:seed" if you wish to seed the database with test data.  Run "rails s" to start the server and then navigate to localhost:3000 to see the output of the API in JSON format

## Known Bugs

There are currently no known bugs. If you discover a bug, please raise an issue here.

## Support and contact details

For further support, please contact Ken Rutan via his Github account.  E-mail will not be listed here as this README is publicly displayed.

## Technologies Used

This website was constructed using a on Ruby-on-Rails framework.

## License

&copy; 2017 Ken Rutan  **MIT License**
