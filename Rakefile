require 'rake'
require 'rspec/core/rake_task'
 
RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = Dir.glob('specs/**/*_spec.rb')
    t.rspec_opts = '--format documentation'
end