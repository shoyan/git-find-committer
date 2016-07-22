require 'spec_helper'

describe GitFindCommitter::Repository do
  describe "#generate_url" do
    it 'returns uri' do
      GitFindCommitter.configuration.set_repo('shoyan/git_find_committer'
)
      repo = GitFindCommitter::Repository.new(GitFindCommitter.configuration)
      expect(repo.generate_url).to eq "https://github.com/shoyan/git_find_committer"
    end

    context 'define url' do
      it 'returns uri' do
        GitFindCommitter.configure do |c|
          c.url = 'https://git.hub.com'
        end
        GitFindCommitter.configuration.set_repo('shoyan/git_find_committer'
                                               )
        repo = GitFindCommitter::Repository.new(GitFindCommitter.configuration)
        expect(repo.generate_url).to eq "https://git.hub.com/shoyan/git_find_committer"
      end
    end

    context 'define url and access_token' do
      it 'returns uri' do
        GitFindCommitter.configure do |c|
          c.url = 'https://git.hub.com'
          c.access_token = 'hogemoge'
        end
        GitFindCommitter.configuration.set_repo('shoyan/git_find_committer'
                                               )
        repo = GitFindCommitter::Repository.new(GitFindCommitter.configuration)
        expect(repo.generate_url).to eq "https://hogemoge:x-oauth-basic@git.hub.com/shoyan/git_find_committer"
      end
    end
  end
end
