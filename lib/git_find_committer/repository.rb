module GitFindCommitter
  class Repository
    def initialize(config)
      @config = config
    end

    def prepare_repo
      if File.exist?(@config.tmp_repo_path)
        `cd #{@config.tmp_repo_path} && git fetch`
      else
        `git clone #{generate_repo_uri} #{@config.tmp_repo_path}`
      end
    end

    def generate_repo_uri
      if @config.access_token.nil?
        "#{@config.repo_uri}/#{@config.repo}"
      else
        uri = @config.repo_uri.scan URI.regexp
        "#{uri[0][0]}://#{@config.access_token}:x-oauth-basic@#{uri[0][3]}/#{@config.repo}"
      end
    end
  end
end
