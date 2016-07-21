module GitFindCommitter
  class Repository
    def initialize(config)
      @config = config
    end

    def prepare_repo
      if File.exist?(@config.repo_dir)
        `cd #{@config.repo_dir} && git fetch`
      else
        `git clone https://#{@config.access_token}:x-oauth-basic@#{@config.uri}/#{@config.owner}/#{@config.repo} #{@config.repo_dir}`
      end
    end
  end
end
