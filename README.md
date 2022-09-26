# Sous Chef Back [![Circle CI](https://circleci.com/gh/platanus/sous-chef-back.svg?style=svg)](https://circleci.com/gh/platanus/sous-chef-back)
This is a Rails application, initially generated using [Potassium](https://github.com/platanus/potassium) by Platanus.

## Local installation

Assuming you've just cloned the repo, run this script to setup the project in your
machine:

    $ ./bin/setup

It assumes you have a machine equipped with Ruby, Node.js, Docker and make.

The script will do the following among other things:

- Install the dependecies
- Create a docker container for your database
- Prepare your database
- Adds heroku remotes

After the app setup is done you can run it with [Heroku Local]

    $ heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local


## Deployment

This project is pre-configured to be (easily) deployed to Heroku servers, but needs you to have the Potassium binary installed. If you don't, then run:

    $ gem install potassium

Then, make sure you are logged in to the Heroku account where you want to create the app and run

    $ potassium install heroku --force

this will create the app on heroku, create a pipeline and link the app to the pipeline.

You'll still have to manually log in to the heroku dahsboard, go to the new pipeline and 'configure automatic deploys' using Github
You can run the following command to open the dashboard in the pipeline page

    $ heroku pipelines:open

![Hint](https://cloud.githubusercontent.com/assets/313750/13019759/fa86c8ca-d1af-11e5-8869-cd2efb5513fa.png)

Remember to connect each stage to the corresponding branch:

1. Staging -> Master
2. Production -> Production

That's it. You should already have a running app and each time you push to the corresponding branch, the system will (hopefully) update accordingly.


## Continuous Integrations

The project is setup to run tests
in [CircleCI](https://circleci.com/gh/platanus/sous-chef-back/tree/master)

You can also run the test locally simulating the production environment using [CircleCI's method](https://circleci.com/docs/2.0/local-cli/).


## Style Guides

Style guides are enforced through a CircleCI [job](.circleci/config.yml) with [reviewdog](https://github.com/reviewdog/reviewdog) as a reporter, using per-project dependencies and style configurations.
Please note that this reviewdog implementation requires a GitHub user token to comment on pull requests. A token can be generated [here](https://github.com/settings/tokens), and it should have at least the `repo` option checked.
The included `config.yml` assumes your CircleCI organization has a context named `org-global` with the required token under the environment variable `REVIEWDOG_GITHUB_API_TOKEN`.

The project comes bundled with configuration files available in this repository.

Linting dependencies like `rubocop` or `rubocop-rspec` must be locked in your `Gemfile`. Similarly, packages like `eslint` or `eslint-plugin-vue` must be locked in your `package.json`.

You can add or modify rules by editing the [`.rubocop.yml`](.rubocop.yml), [`.eslintrc.json`](.eslintrc.json) or [`.stylelintrc.json`](.stylelintrc.json) files.

You can (and should) use linter integrations for your text editor of choice, using the project's configuration.


## Seeds

To populate your database with initial data you can add, inside the `/db/seeds.rb` file, the code to generate **only the necessary data** to run the application.
If you need to generate data with **development purposes**, you can customize the `lib/fake_data_loader.rb` module and then to run the `rake load_fake_data` task from your terminal.


## Internal dependencies

### Rails pattern enforcing types

This project uses [Power-Types](https://github.com/platanus/power-types) to generate Services, Commands, Utils and Values.

### API Support

This projects uses [Power API](https://github.com/platanus/power_api). It's a Rails engine that gathers a set of gems and configurations designed to build incredible REST APIs.

### Error Reporting

To report our errors we use [Sentry](https://github.com/getsentry/raven-ruby)

## Testing

We use:
- [RSpec](https://github.com/rspec/rspec-rails): the testing framework.
- [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers): one-liners to test common Rails functionality that, if written by hand, would be much longer, more complex, and error-prone.
- [Factory Bot](https://github.com/thoughtbot/factory_bot_rails): a fixtures replacement with a straightforward definition syntax, support for multiple build strategies (saved instances, unsaved instances, attribute hashes, and stubbed objects), and support for multiple factories for the same class (user, admin_user, and so on), including factory inheritance.
- [Faker](https://github.com/faker-ruby/faker): a port of Perl's Data::Faker library that generates fake data.
- [Guard](https://github.com/guard/guard): automates various tasks by running custom rules whenever file or directories are modified. We use it to run RSpec when files change.

Place your unit tests inside the `spec` directory.

To run unit tests: `bin/guard`

#### System tests

We use, in addition to the previous gems:
- [Capybara](https://github.com/teamcapybara/capybara): helps you test web applications by simulating how a real user would interact with your app. It is agnostic about the driver running your tests and comes with Rack::Test and Selenium support built in. WebKit is supported through an external gem.
- [Webdrivers](https://github.com/titusfortner/webdrivers): run Selenium tests more easily with automatic installation and updates for all supported webdrivers.

Place your system tests inside the `spec/system` directory.

To run system tests: `bin/rspec --tag type:system`

