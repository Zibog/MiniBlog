ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Returns true if test user logged in
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Logs in a test user
  def log_in_as(user, options={})
    password = options[:password] || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, params: { session: { email: user. email,
                                password: password, remember_me: remember_me } }
    else
      session_auth=(user)
      #session[:user_id] = user.id
      #log_in(user)
    end
  end

  # Returns true from integration tests
  def integration_test?
    defined?(post_via_redirect)
  end
end
