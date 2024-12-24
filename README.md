# PreCommit4J

This project provides useful pre-commit hooks for your projects. 

## Checkstyle

The Checkstyle hook enables you to validate your Java source code using [checkstyle](https://checkstyle.sourceforge.io/). 

This integration is unique in the sense that it does not require Docker and thus is lightweight to run on any local machine.

Moreover, it allows you to explicitly provide the path for checkstyle.jar file which allows you to use newer versions
than the default easily.

## Usage

```yaml
  - repo: https://github.com/SeunMatt/precommit4j
    rev: v0.1.0
    hooks:
      - id: checkstyle
        exclude: |
          (?x)^(
                 .*/test/.*
            )$
        args: [ "-c", "checkstyle.xml"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, 
and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SeunMatt/precommit4j.git.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
