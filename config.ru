require "rubygems"
require "rack/auth/basic"
require "geminabox"
require "active_support/all"

Geminabox.data = "/var/geminabox-data"

username = ENV.fetch("BASIC_AUTH_USERNAME") { nil }
password = ENV.fetch("BASIC_AUTH_PASSWORD") { nil }

unless username.nil? || password.nil?
  use Rack::Auth::Basic do |given_name, given_pass|
    given_name == username && password == given_pass
  end
end

run Geminabox::Server
