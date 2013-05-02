require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.ignore_localhost = true
end

RSpec.configure do |c|
 c.treat_symbols_as_metadata_keys_with_true_values = true
end
