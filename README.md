# Indieweb::PostTypes::Identifier::Scrobble

Indieweb::PostTypes::Identifier::Scrobble is a Ruby gem to extend [Indieweb::PostTypes](https://rubygems.org/gems/indieweb-post_types) discovery to support my version of the [`scrobble` post type](https://indieweb.org/scrobble).

The `scrobble` post type is not standardised, and this gem implements my own version of it, as used with my Micropub endpoint. The JSON I send when posting scrobbles is similar to the following:

```json
{
  "type": [
    "h-entry"
  ],
  "properties": {
    "content": [
      "Go! - Public Service Broadcasting (The Race For Space)"
    ],
    "scrobble-of": [
      {
        "type": ["h-cite"],
        "properties": {
          "title": ["Go!"],
          "artist": ["Public Service Broadcasting"],
          "album": ["The Race For Space"],
          "time": ["4:12"],
          "genre": ["Alternative"],
          "when": ["2018-04-19 13:11:33 UTC"]
        }
      }
    ]
  }
}
```

If a standard emerges in the future for posting scrobbles I will update this gem to support it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'indieweb-post_types-identifier-scrobble', github: 'srushe/indieweb-post_types-identifier-scrobble'
```

And then execute:

    $ bundle

## Usage

Once the gem is installed you need to configure `Indieweb::PostTypes` to use it. The following code would configure `Indieweb::PostTypes` to use the `scrobble` identifier before the default `article` identifier. You could also choose to insert the `scrobble` identifier before a different identifier if you so wish.

```ruby
Indieweb::PostTypes.configure do |config|
  config.insert_identifier(klass: Indieweb::PostTypes::Identifier::Scrobble,
                           before: Indieweb::PostTypes::Identifier::Article)
end
```

Then just use `Indieweb::PostTypes` as normal...

```ruby
post_type = Indieweb::PostTypes.type_from(data)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/srushe/indieweb-post_types-identifier-scrobble. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Indieweb::PostTypes::Scrobble project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/srushe/indieweb-post_types-identifier-scrobble/blob/master/CODE_OF_CONDUCT.md).
