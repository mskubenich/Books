require 'capybara/rails'
require 'capybara/poltergeist'

# https://gist.github.com/ericboehs/7125105
module Capybara::Poltergeist
  class Client
    private
    def redirect_stdout(to = @write_io)
      prev = STDOUT.dup
      prev.autoclose = false
      $stdout = to
      STDOUT.reopen(to)

      prev = STDERR.dup
      prev.autoclose = false
      $stderr = to
      STDERR.reopen(to)
      yield
    ensure
      STDOUT.reopen(prev)
      $stdout = STDOUT
      STDERR.reopen(prev)
      $stderr = STDERR
    end
  end
end
class WarningSuppressor
  class << self
    def write(message)
      if message =~ /QFont::setPixelSize: Pixel size <= 0/ || message =~/CoreText performance note:/ || message =~/Method userSpaceScaleFactor in class NSView is deprecated/ then
        0
      else
        puts(message); 1;
      end
    end
  end
end

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, phantomjs_logger: WarningSuppressor, timeout: 180)
end

Capybara.javascript_driver = :poltergeist
Capybara.default_driver = Capybara.javascript_driver

Capybara.configure do |config|
  config.match = :one
  config.exact_options = true
  config.ignore_hidden_elements = true
  config.visible_text_only = true
end

Capybara.default_wait_time = 30

def capture_screenshot(context)
  failed = context.instance_variable_get(:@passed).blank?

  if Capybara::Screenshot.autosave_on_failure && failed
    filename_prefix = Capybara::Screenshot.filename_prefix_for(:minitest, context)

    saver = Capybara::Screenshot::Saver.new(Capybara, Capybara.page, true, filename_prefix)
    saver.save
  end
end