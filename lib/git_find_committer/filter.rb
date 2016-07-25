module GitFindCommitter
  class Filter
    def initialize(config)
      @config = config
    end

    def select_committer(committer)
      unless @config.available_committer_names.nil?
        committer.select {|c| @config.available_committer_names.include?(c[:name]) }
      else
        committer
      end
    end
  end
end
