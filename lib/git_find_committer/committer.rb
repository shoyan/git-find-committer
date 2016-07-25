module GitFindCommitter
  class Committer
    def initialize(repo, branch, config)
      @config = config
      @config.set_repo(repo)
      @config.branch = branch
    end

    def diff_files
      `cd #{@config.tmp_repo_path} && git diff --name-only origin/#{@config.branch} origin/master`.split("\n").map { |val| val.chomp }
    end

    def search
      Repository.new(@config).prepare_repo

      result = diff_files.each_with_object(Hash.new(0)) do |file, k|
        find(file).each do |committer, commit_count|
          k[committer] += commit_count
        end
      end.sort { |(k1, v1), (k2, v2)| v2 <=> v1 }.to_h

      result = result.each_with_object([]) do |(key,val),arr|
        arr << {name: key, commit_count: val}
      end
      Response.new(result)
    end

    def find(file)
      {"#{file}" => `cd #{@config.tmp_repo_path} && git log --pretty=format:"%an" #{file} 2>/dev/null` }.each_with_object(Hash.new(0)) do |(file, committer), k|
        committer.split("\n").each {|r| k[r]+=1 }
      end.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }.to_h
    end
  end
end
