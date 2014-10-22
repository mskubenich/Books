ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/spec"

require "bundler/setup"

require "minitest/autorun" unless defined?(Zeus)
require "action_controller"
require "action_controller/test_case"

require File.expand_path('../../config/environment', __FILE__)

require_relative './capybara_helper'
require "minitest/rails/shoulda"

DatabaseCleaner.strategy = :truncation

class MiniTest::Spec
  include ActiveSupport::Testing::SetupAndTeardown
  include FactoryGirl::Syntax::Methods

  alias :method_name :__name__ if defined? :__name__

  before :each do
    DatabaseCleaner.clean
  end
end

class ControllerSpec < MiniTest::Spec
  include FactoryGirl::Syntax::Methods
  include Rails.application.routes.url_helpers
  include ActionController::TestCase::Behavior

  before do
    @routes = Rails.application.routes
  end
end

MiniTest::Spec.register_spec_type(/Controller$/, ControllerSpec)

class AcceptanceSpec < MiniTest::Spec
  include FactoryGirl::Syntax::Methods
  include Rails.application.routes.url_helpers
  include Capybara::DSL

  before do
    @routes = Rails.application.routes
    #visit logout_path TODO uncomment this after logout added
  end

  after do |context|
    capture_screenshot(context)
    Capybara.reset_sessions! # Forget the (simulated) browser state
    Capybara.reset! # Forget the (simulated) browser state
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end
end

MiniTest::Spec.register_spec_type(/Integration$/, AcceptanceSpec)

def response_must_be(type, message = nil)
  validate_request!

  if type.in?([:success, :missing, :redirect, :error]) && @response.send("#{type}?")
    assert true # to count the assertion
  elsif type.is_a?(Fixnum) && @response.response_code == type
    assert true # to count the assertion
  elsif type.is_a?(Symbol) && @response.response_code == Rack::Utils::SYMBOL_TO_STATUS_CODE[type]
    assert true # to count the assertion
  else
    flunk(build_message(message, "Expected response to be a <?>, but was <?>", type, @response.response_code))
  end
end

def login(user)
  session[:email] = user.email
  session[:password] = user.password
  session[:user_id] = user.id
end

def wait_for_ajax
  Timeout.timeout(Capybara.default_wait_time) do
    active = page.evaluate_script('!(typeof(jQuery) === "undefined") && jQuery.active')
    until active == 0
      active = page.evaluate_script('!(typeof(jQuery) === "undefined") && jQuery.active')
    end
  end
end