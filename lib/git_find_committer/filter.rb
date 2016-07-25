module GitFindCommitter
  class Filter
    def initialize(config)
      @config = config
    end

    def select_committer(committer)
      committer.select {|c| @config.available_names.include?(c[:name]) }
    end
  end
end
