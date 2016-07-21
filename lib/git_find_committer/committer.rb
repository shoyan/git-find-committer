module GitFindCommitter
  class Committer
    def initialize(repo, branch, config)
      @config = config
      @config.set_repo(repo)
      @config.branch = branch
    end

    def diff_files
      `cd #{@config.repo_dir} && git diff --name-only origin/#{@config.branch} origin/master`.split("\n").map { |val| val.chomp }
    end

    def aggregate
      Repository.new(@config).prepare_repo

      result = diff_files.each_with_object(Hash.new(0)) do |file, k|
        find(file).each do |committer, commit_count|
          k[committer] += commit_count
        end
      end.sort { |(k1, v1), (k2, v2)| v2 <=> v1 }.to_h

      def result.names(limit=0)
        names = self.keys
        return names if limit <= 0
        names[0..(limit-1)]
      end
      result
    end

    def find(file)
      {"#{file}" => `cd #{@config.repo_dir} && git log --pretty=format:"%an" #{file} 2>/dev/null` }.each_with_object(Hash.new(0)) do |(file, committer), k|
        committer.split("\n").each {|r| k[r]+=1 }
      end.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }.to_h
    end
  end
end
