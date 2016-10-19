require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace "gem" do
  desc 'Build a gem package'
  task :build do
    sh "gem build git_find_committer.gemspec"
  end

  desc 'Push a gem package'
  task :push do
    Rake::Task["gem:build"].execute
    sh "gem push git_find_committer-#{GitFindCommitter::VERSION}.gem"
  end
end
