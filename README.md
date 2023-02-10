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

  2. [Gemfile syntax](https://bundler.io/guides/gemfile.html)

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

  3. RSpec

      3.1. [Basic structure](https://relishapp.com/rspec/rspec-core/v/3-9/docs/example-groups/basic-structure-describe-it)

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

      3.2 [Expectation](https://relishapp.com/rspec/rspec-expectations/docs)

          expect(actual).to matcher(expected)
          expect(actual).not_to matcher(expected)

      Example

          RSpec.describe Account do
            it "has a balance of zero when first created" do
              expect(Account.new.balance).to eq(Money.new(0))
            end
          end

      3.3. [Built-in Matchers](https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers)

      3.4. [System spec:](https://relishapp.com/rspec/rspec-rails/v/6-0/docs/system-specs/system-spec)

        - wraps around **Rails' System Testing**.
        - uses Capybara under the hood (Capybara gem is automatically required).
        - run with the Selenium driver by default (`driven_by(:selenium)`)
        - `type: :system`
        - runs in a transaction so NO need DatabaseCleaner.

              require "rails_helper"

              RSpec.describe "Post management", type: :system do
                it "creates a new post" do
                    visit new_post_path
                    fill_in "Title", with: "My First Post"
                    fill_in "Body", with: "This is the body of my first post."
                    click_on "Create Post"

                    expect(page).to have_content("Post was successfully created")
                    expect(page).to have_content("My First Post")
                    expect(page).to have_content("This is the body of my first post.")
                end
              end

      3.5. [Feature spec](https://relishapp.com/rspec/rspec-rails/v/6-0/docs/feature-specs/feature-spec)

        - high-level tests via app's external interface, usually web pages.
        - `type: :feature` (OR set `config.infer_spec_type_from_file_location!` and place files in `spec/features` instead)
        - DSL:
          + `feature` is aliased by `describe`
          + `scenario` is aliased by `it`
        - `RSpec.feature` block defines a feature test

              require "rails_helper"

              RSpec.feature "Visitor creates a post", type: :feature do
                scenario "with valid attributes" do
                    visit new_post_path
                    fill_in "Title", with: "My First Post"
                    fill_in "Body", with: "This is the body of my first post."
                    click_button "Create Post"

                    expect(page).to have_content("Post was successfully created.")
                    expect(page).to have_content("My First Post")
                    expect(page).to have_content("This is the body of my first post.")
                end

                scenario "with invalid attributes" do
                    visit new_post_path
                    fill_in "Title", with: ""
                    fill_in "Body", with: ""
                    click_button "Create Post"

                    expect(page).to have_content("Title can't be blank")
                    expect(page).to have_content("Body can't be blank")
                end
              end

      3.6. [Request spec:](https://relishapp.com/rspec/rspec-rails/v/6-0/docs/request-specs/request-spec)

        - wraps around **Rails' Integration Testing**.
        - `type: :request` (OR set `config.infer_spec_type_from_file_location!` and place files in `spec/requests` instead)
        - Capybara is NOT supported in request specs

              require "rails_helper"

              RSpec.describe "Post management", type: :request do
                it "creates a new post" do
                    post posts_path, params: { post: { title: "My First Post", body: "This is the body of my first post." } }
                    follow_redirect!

                    expect(response).to have_http_status(:ok)
                    expect(response.body).to include("Post was successfully created")
                    expect(response.body).to include("My First Post")
                    expect(response.body).to include("This is the body of my first post.")
                end
              end

      3.7. [Controller spec:](https://relishapp.com/rspec/rspec-rails/v/6-0/docs/controller-specs)

        - wraps around **Rails' Functional Testing**.
        - `type: :controller` (OR set `config.infer_spec_type_from_file_location!` and place files in `spec/controllers` instead)

              require "rails_helper"

              RSpec.describe PostsController, type: :controller do
                describe "GET #index" do
                    it "returns a success response" do
                      get :index
                      expect(response).to be_successful
                    end
                end

                describe "GET #show" do
                    it "returns a success response" do
                      post = Post.create!(title: "My First Post", body: "This is the body of my first post.")
                      get :show, params: { id: post.to_param }
                      expect(response).to be_successful
                    end
                end
              end

          Example with Capybara:

              require "rails_helper"

              RSpec.describe PostsController, type: :controller do
                describe "GET #new" do
                    it "renders the new template" do
                      get :new
                      expect(response).to render_template(:new) # delegates to `assert_template` Rails assestion
                    end
                end

                describe "POST #create" do
                    it "creates a new post" do
                      post :create, params: { post: { title: "My First Post", body: "This is the body of my first post." } }
                      expect(response).to redirect_to(post_path(assigns(:post))) # delegates to `assert_redirected_to` Rails assestion
                    end
                end
              end

  4. Software Development Process

      4.1. TDD

        - [Test Driven Development](https://semaphoreci.com/blog/test-driven-development)
        - Test-First Programming
        - allows **short feedback loops** where developers write just the right amount of code and design to make the software work


          ![TDD](public/images/tdd.jpeg)

        - [Mocking technique](https://semaphoreci.com/community/tutorials/mocking-with-rspec-doubles-and-expectations)

      4.2. BDD

        - [Behavior-Driven Development](https://semaphoreci.com/community/tutorials/behavior-driven-development)
        - is a software development process which is about minimizing feedback loop
        - combines general techniques and principles of **Test Driven Development** (TDD)
        - what, not how: We think about what the system does, rather than how it does it.
        - is not UI testing.

          ![BDD](public/images/bdd.jpeg)

  5. Testing Frameworks:

      5.1. [**Capybara**](https://semaphoreci.com/community/tutorials/integration-testing-ruby-on-rails-with-minitest-and-capybara#what-is-integration-testing): for writing integration tests.
        - an acceptance test framework for webapp.
        - to do end-to-end testing in Rails applications.
        - to simulate a user on a web page and interact with the web page.
        - runs in headless mode by default.

      5.2. [**Cucumber**](https://medium.com/@enikozsoldos93/cucumber-in-ruby-on-rails-1a4c2561ae54): for behavior-driven development (BDD), which allows developers to write tests in a natural language syntax.

  6. Resources:

      - [Intro RSpec and Capybara testing](https://rubyyagi.com/intro-rspec-capybara-testing/)
      - [Cucumber](https://medium.com/@enikozsoldos93/cucumber-in-ruby-on-rails-1a4c2561ae54)
      - [Rails Functional Testing](https://guides.rubyonrails.org/testing.html#functional-tests-for-your-controllers)
      - [Rails Integration Testing](https://guides.rubyonrails.org/testing.html#integration-testing)
      - [Rails System Testing](https://guides.rubyonrails.org/testing.html#system-testing)
      - [Mocking with RSpec: Doubles and Expectations](https://semaphoreci.com/community/tutorials/mocking-with-rspec-doubles-and-expectations)
      - [Integration Testing Ruby on Rails with Minitest and Capybara](https://semaphoreci.com/community/tutorials/integration-testing-ruby-on-rails-with-minitest-and-capybara#what-is-integration-testing)