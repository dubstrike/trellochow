# Trellochow

Trellchow is a CLI tool to easily create trello cards based on the following template:

![trello card template](https://i.imgur.com/OoVetuD.png)

## Installation

Install the trellochow gem:

```
gem install trellochow

```

Then you have to add the api keys as shell environments to authenticate with trello.

1. Visit: https://trello.com/1/appKey/generate](https://trello.com/1/appKey/generate)
2. The first key in the top input field will be your `TRELLO_DEVELOPER_PUBLIC_KEY`
3. Replace the `TRELLO_DEVELOPER_PUBLIC_KEY` in the following url:
```
https://trello.com/1/authorize?key=TRELLO_DEVELOPER_PUBLIC_KEY&name=trello-cli&expiration=never&response_type=token&scope=read,write
```
4. Open the url and authorize the application.
5. The returned key will be your `TRELLO_MEMBER_TOKEN`

Define the following variables accordingly and place this into your .bashrc or .zshrc:

```
export TRELLO_DEVELOPER_PUBLIC_KEY=
export TRELLO_MEMBER_TOKEN=
```

## Usage

You can call `trellochow` to interactively create a card.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/trellochow. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

