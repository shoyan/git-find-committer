module GitFindCommitter
  class Configuration
    def initialize
      @owner = nil
      @repo  = nil
      @branch = branch
      @access_token = nil
      @limit = 2
      @repo_uri = "https://github.com"
      @tmp_repo_dir = '/tmp/git_find_committer'
    end
    attr_accessor :owner, :repo, :repo_name, :branch, :access_token, :limit, :repo_uri, :tmp_repo_dir

    def set_repo(repo)
      @repo = repo
      repo = repo.split("/")
      @owner = repo[0]
      @repo_name = repo[1]
      self
    end

    def tmp_repo_path
      File.join(@tmp_repo_dir, @repo_name)
    end
  end
end
