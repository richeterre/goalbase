Goalbase
========

Goalbase serves as a backend for the reactive MVVM showcase app [ObjectiveGoal](https://github.com/richeterre/ObjectiveGoal).

It is built using the [Grape](https://github.com/intridea/grape) API framework, mounted on a vanilla [Rails 4](http://rubyonrails.org/) installation.

Setup
-----

Clone the project and run

    bundle install

in the project's root folder. To set up the database, make sure you have a running PostgreSQL instance. A quick way is to install Heroku's [Postgres.app](http://postgresapp.com/). Then by running

    rake db:setup

all necessary tables should get created. Finally, start the app using

    rails server

and check that it works by hitting the API endpoints:

    http://localhost:3000/api/v1/players
    http://localhost:3000/api/v1/matches

Both should display an empty JSON array, as you don't have any data yet. To change that, clone [ObjectiveGoal](https://github.com/richeterre/ObjectiveGoal) and launch it on your iOS simulator.

License
-------
This project is available under the [MIT license](http://choosealicense.com/licenses/mit/).
