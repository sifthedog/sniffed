# Sniffed

## It's working. But is it? If you wanna help, you can start with testing for multiple Rails versions

Have you ever faced a code that, for whatever reason, does something like this?
```ruby
dog = Dog.find(1)
# => <Dog:0x00000 id: 1, first_name: "Jujuba", last_name: "The Crazy">
ActiveRecord::Base.transaction do
  dog.update(first_name: 'Sif')
  dog.update(last_name: 'The Dog')
end
```

Depending on your logic, it may make sense. And one day, you suddenly wake up needing to use `saved_changes`, but then...:
```ruby
dog.saved_changes
# => { 'last_name' => ['Doe', 'The Dog'] }
```

Yep, you've lost track of the `first_name` changes. Sad, isn't it? But wait! I have a solution

**Sniffed** is the tool you were asking for all along!!!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sniffed'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sniffed

## Usage

Just add `sniffed` to the model you want to keep track of those changes and then starting using like:

```ruby
dog.commited_changes # if you are all serious
# => { 'first_name' => ['Jujuba', 'Sif'], 'last_name' => ['The Crazy', 'The Dog'] }
```

If, for whatever reason, you want to reset these changes:

```ruby
dog.reset_commited_changes
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joaopfernandesc/sniffed. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/joaopfernandesc/sniffed/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sniffed project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/joaopfernandesc/sniffed/blob/master/CODE_OF_CONDUCT.md).
