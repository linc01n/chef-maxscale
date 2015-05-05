begin
  require 'rubocop/rake_task'
  require 'rspec/core/rake_task'
  require 'kitchen/rake_tasks'

  RuboCop::RakeTask.new
  RSpec::Core::RakeTask.new(:chefspec)
  Kitchen::RakeTasks.new
end

# default tasks are quick, commit tests
task default: %w(rubocop chefspec kitchen:all)
