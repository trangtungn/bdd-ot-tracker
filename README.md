# Overtime Tracker
A Ruby on Rails application to track overtime hours for employees. Built with TDD and BDD with the RSpec and Capybara testing frameworks.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

  - Ruby 3.0.2

  - Rails 6.1.4

  - PostgreSQL 13

### Installing

  1. Clone the repository to your local machine

          git clone https://github.com/[your-username]/overtime-tracker.git

  2. Change into the project directory

          cd overtime-tracker

  3. Install the required gems

          bundle install

  4. Setup the database

          rake db:setup

  5. Start the rails server

          rails server

  6. Visit http://localhost:3000 in your web browser to access the application.

## Running the tests
This application uses RSpec for testing. To run the tests, use the following command:

    rspec

## Deployment
This application is ready to be deployed to a production environment.

## Built With

  - Ruby 3.0.2

  - Rails 6.1.4

  - PostgreSQL 13

  - RSpec

  - Bootstrap


## Contributing

  1. Fork the repository
  1. Create your feature branch (git checkout -b my-new-feature)
  1. Commit your changes (git commit -am 'Add some feature')
  1. Push to the branch (git push origin my-new-feature)
  1. Create a new Pull Request

## References

  1. This app following guidance from Professional Rails Code Along course of Jordan Hudgens in Udemy

  1. [Gemfile syntax](https://bundler.io/guides/gemfile.html)

      + `source`

            source 'https://rubygems.org'

            # Gems here

            source 'https://gems.example.com' do
              # Gems from the alternative source here
              gem 'my_gem', '1.0'
              gem 'another_gem', '1.2.1'
            end

            # to fetch a single gem from a private gem server
            gem 'my_gem', '1.0', :source => 'https://gems.example.com'

            # included credentials as part of the source URL
            # Credentials in the source URL will take precedence over credentials set using `config`
            source "https://user:password@gems.example.com"

        Some gem sources require a username and password.

            $ bundle config https://gems.example.com/ user:password

        Git repositories are also valid gem sources, default is `main` branch. Or specify `:tag`, `:branch`, or `:ref`.

            gem 'nokogiri', :git => 'https://github.com/tenderlove/nokogiri.git', :branch => '1.4'

        To use an unpacked gem directly from the filesystem, use `path`:

            gem 'extracted_library', :path => './vendor/extracted_library'

            # to use multiple local gems
            path 'components' do
              gem 'admin_ui'
              gem 'public_ui'
            end

      + gem's version

            gem 'nokogiri'
            gem 'rails', '5.0.0'
            gem 'rack',  '>=1.0'

            # `~> 1.1` is identical to `>= 1.1` and `< 2.0`
            gem 'thin',  '~>1.1'

        `~> 2.0.3` is identical to `>= 2.0.3` and `< 2.1`

        `~> 2.2.beta` will match prerelease versions like `2.2.beta.12`

      + require gem

            # If a gem’s main file is different than the gem name, require it
            gem 'rack-cache', :require => 'rack/cache'

            # to prevent bundler requiring the gem, but still install it and maintain dependencies
            gem 'rspec', :require => false

        You will need to call `Bundler.require` in your application.

            require 'rspec'

      + group gem

            gem 'wirble', :group => :development
            gem 'debugger', :group => [:development, :test]

            group :test do
              gem 'rspec'
            end

      + specify the required version of Ruby

            ruby '1.9.3

        more specific with the `:engine` and `:engine_version`

            ruby '1.9.3', :engine => 'jruby', :engine_version => '1.6.7'

  2. [RSpec basic structure](https://relishapp.com/rspec/rspec-core/v/3-9/docs/example-groups/basic-structure-describe-it)

      - `describe` aliases for `example_group`
      - `context`: nested group
      - `it`: example, aliases for `specify`

            # nested_example_groups_spec.rb

            RSpec.describe "something" do
              context "in one context" do
                it "does one thing" do
                end
              end
            end

        Run:

            $ rspec nested_example_groups_spec.rb -fdoc

        Output:

            something
              in one context
                does one thing

  3. [RSpec Expectation](https://relishapp.com/rspec/rspec-expectations/docs)

          expect(actual).to matcher(expected)
          expect(actual).not_to matcher(expected)

      Example

          RSpec.describe Account do
            it "has a balance of zero when first created" do
              expect(Account.new.balance).to eq(Money.new(0))
            end
          end

  4. [RSpec Built-in Matchers](https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers)
