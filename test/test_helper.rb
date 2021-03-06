require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods
end

$google_auth_hash =
{
    :provider => 'google_oauth2',
    :uid => '1234',
    info: {
        name: 'Foo Bar',
        email: 'foo_bar@gmail.com'
    },
    credentials: {
        token: 123456,
        expires_at: 123456789
    }
}