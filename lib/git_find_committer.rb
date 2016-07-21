require "git_find_committer/version"
require "git_find_committer/committer"
require "git_find_committer/configuration"
require "git_find_committer/repository"

module GitFindCommitter
  def self.configuration
    @configuration ||= GitFindCommitter::Configuration.new
  end

  def self.configure
    yield configuration if block_given?
  end

  def self.aggregate(repo, branch)
    committer = Committer.new(repo, branch, self.configuration)
    committer.aggregate
  end
end
