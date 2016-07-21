require 'spec_helper'

describe GitFindCommitter::Configuration do
  let(:config) {  GitFindCommitter::Configuration.new }

  describe "#set_repo" do
    it 'returns GitFindCommitter::Configuration' do
      expect(config.set_repo('shoyan/git_find_committer').class).to eq(GitFindCommitter::Configuration)
    end

    it 'sets repo, owner, repo_name' do
      config.set_repo('shoyan/git_find_committer')
      expect(config.repo).to eq('shoyan/git_find_committer')
      expect(config.owner).to eq('shoyan')
      expect(config.repo_name).to eq('git_find_committer')
    end
  end

  describe "#tmp_repo_path" do
    it 'returns tmp repo path' do
      config.set_repo('shoyan/git_find_committer')
      expect(config.tmp_repo_path).to eq "/tmp/git_find_committer/git_find_committer"
    end
  end
end
