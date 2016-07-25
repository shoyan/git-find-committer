require 'spec_helper'

describe GitFindCommitter::Filter do
  let(:config) do
    config = GitFindCommitter::Configuration.new
    config.tap { |c| c.available_names = %w(shoyan) }
  end

  describe "#select_committer" do
    let(:committer) do
      [{name: 'shoyan', commit_count: '11'},
       {name: 'hoge', commit_count: '10'}]
    end

    it 'returns committer on available_names' do
      filter = GitFindCommitter::Filter.new(config)
      expect(filter.select_committer(committer)).to eq  [{:name=>"shoyan", :commit_count=>"11"}]
    end
  end
end
