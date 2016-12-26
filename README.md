# GitFindCommitter

[![CircleCI](https://circleci.com/gh/shoyan/git_find_committer/tree/master.svg?style=svg)](https://circleci.com/gh/shoyan/git_find_committer/tree/master)

The git_find_commiter is a tool to seek committers from the commit history of git.
This tool will help the code review your team.

In Japanese.

* http://48n.jp/blog/2016/07/25/introduce-to-git-find-committer/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'git_find_committer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install git_find_committer

## Usage

```ruby
require 'git_find_committer'

committer = GitFindCommitter.search(repo: 'balloonbros/sutekki', branch: 'add-ui')
=> [{:name=>"Shohei Yamasaki", :commit_count=>51}, {:name=>"keitakawamoto", :commit_count=>21}]
committer.names(1)
=> ["Shohei Yamasaki"]
```

## Working with GitHub Enterprise

With a bit of setup, you can also use GitFindCommitter with your Github Enterprise instance.

```ruby
GitFindCommitter.configure do |c|
  c.url = "https://<hostname>"
  c.access_token = "<your 40 char token>"
end
```

## Filtering

You can filter the committers.

```ruby
GitFindCommitter.configure do |c|
  c.available_committer_name = %w(shoyan)
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/git_find_committer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

