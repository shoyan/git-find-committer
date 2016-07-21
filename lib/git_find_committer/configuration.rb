module GitFindCommitter
  class Configuration
    def initialize
      @owner = nil
      @repo  = nil
      @branch = branch
      @access_token = nil
      @limit = 2
      @uri = "github.com"
      @base_repo_dir = '/tmp/git_find_committer'
    end
    attr_accessor :owner, :repo, :branch, :access_token, :limit, :uri, :base_repo_dir

    def set_repo(repo)
      repo = repo.split("/")
      @owner = repo[0]
      @repo  = repo[1]
    end

    def repo_dir
      File.join(@base_repo_dir, @repo)
    end
  end
end
