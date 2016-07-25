require 'spec_helper'

describe GitFindCommitter::Response do
  describe "#names" do
    let(:committer) do
      [{name: 'shoyan', commit_count: '11'},
       {name: 'hoge', commit_count: '10'}]
    end

    it 'returns names of committer ' do
      response = GitFindCommitter::Response.new(committer)
      expect(response.names).to eq(['shoyan', 'hoge'])
      expect(response.names(1)).to eq(['shoyan'])
    end
  end
end
