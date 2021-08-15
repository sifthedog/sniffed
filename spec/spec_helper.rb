# frozen_string_literal: true

require "bundler/setup"
Bundler.setup

require "active_record"
require "active_support"
require "sniffed"
require "sniffed_spec_helpers"
require "support/active_record/models"

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

SUPPORT_PATH = Pathname.new(File.expand_path(__dir__)).join("support")
Dir[SUPPORT_PATH.join("*.rb")].sort.each { |f| require f }
load(SUPPORT_PATH.join("active_record/schema.rb"))

RSpec.configure do |config|
  config.include SniffedSpecHelpers

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
