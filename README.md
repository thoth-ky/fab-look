# README
[![CircleCI](https://circleci.com/gh/thoth-ky/fab-look/tree/develop.svg?style=svg)](https://circleci.com/gh/thoth-ky/fab-look/tree/develop)

This is a Salon managment app on Ruby on Rails. This application was created as a collaboratve effort with the intention to learn the following technologies in Rails.

1. GraphQl
2. Webpacker
3. Rails Caching

## Ruby version

  Build on ```ruby-2.5.1``` and ```Rails 5.2.2```

## System dependencies

  - Postgresql

## Configuration

  To setup follow these instructions

1. Clone the repos 
    ```bash
    git clone https://github.com/thoth-ky/fab-look.git
    ```
2. `CD` the newly created `fab-look` folder
    ```bash
    cd fab-look
    ```
3. Install all dependencies
    ```bash
    bundle install && yarn install
    ```
4. Proceed to setup the database

## Database creation

1. To create necessary databases and perform migrations
    ```bash
    rake db:create && rake db:migrate
    ```
2. To seed the database with dummy data run
    ```bash
      rake db:create && rake db:migrate
    ```

## How to run the test suite
 We use `rspec` for testing. To run tests locally run

 ```bash
   rspec 
 ```

## Run Local

To run locally, use
 ```bash
   rails s
 ```

## Authors
This project is a collaborative effort of 2 developers interested in learning.

1. [Ruth Njeri Waiganjo](https://github.com/RuthNjeri)
2. [Mutuku Kyalo](https://github.com/thoth-ky)

## Contribution
We welcome suggestions via the [Issues Board](https://github.com/thoth-ky/fab-look/issues). Feel free to clone the fork and do your own modifications too.
