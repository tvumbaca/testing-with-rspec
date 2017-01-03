begin
  require 'rspec/core/rake_task'

  task :default => :spec

  desc "run tests for this lab"
  RSpec::Core::RakeTask.new do |task|
    lab = Rake.application.original_dir
    task.pattern = "#{lab}/spec/*_spec.rb"
    task.rspec_opts = ['-f documentation', '-r ./rspec_config']
    task.verbose = false
  end
rescue LoadError
  # no rspec available
end
