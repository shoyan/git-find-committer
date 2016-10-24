module GitFindCommitter
  class Repository
    def initialize(config)
      @config = config
    end

    def prepare_repo
      if File.exist?(@config.tmp_repo_path)
        `cd #{@config.tmp_repo_path} && git fetch`
      else
        `git clone #{generate_url} #{@config.tmp_repo_path}`
      end
      self
    end

    def pull_master
      `git pull origin master`
      self
    end

    def generate_url
      if @config.access_token.nil?
        "#{@config.url}/#{@config.repo}"
      else
        uri = @config.url.scan URI.regexp
        "#{uri[0][0]}://#{@config.access_token}:x-oauth-basic@#{uri[0][3]}/#{@config.repo}"
      end
    end
  end
end
