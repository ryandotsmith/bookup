HOST = 'www.bookup.org'
DO_NOT_REPLY = "donotreply@bookup.org"

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  config.time_zone = 'UTC'

  config.active_record.observers = :book_observer

  config.action_controller.session = {
    :session_key => '_bookup_session',
    :secret      => '81db85d13a95fd4441145739a8760b073aaf422f2db4dcd99d4f78514f8e55849a58d61b8558c6327ff4aacafc0d78c302e9f3dc3b7839a44ca8615af121760b'
  }

  config.gem "mbleigh-acts-as-taggable-on", 
    :source => "http://gems.github.com", 
    :lib => "acts-as-taggable-on"

  config.gem 'rubaidh-google_analytics', 
    :lib => 'rubaidh/google_analytics', 
    :source => 'http://gems.github.com'
  config.gem "thoughtbot-clearance", 
    :lib     => 'clearance', 
    :source  => 'http://gems.github.com', 
    :version => '0.5.3'

end
require "isbn/tools"
Rubaidh::GoogleAnalytics.tracker_id = "UA-8299171-1"
AmazonProducts.config_location = 'config/amazon.yml'
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(:default => '%m/%d/%Y')
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(:default => '%m/%d/%Y')
