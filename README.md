# PreCommit4J

This project provides useful pre-commit hooks for your projects. 

## Checkstyle

The Checkstyle hook enables you to validate your Java source code using [checkstyle](https://checkstyle.sourceforge.io/). 

This integration is unique in the sense that it does not require Docker and thus is lightweight to run on any local machine.

Furthermore, it allows you to use newer versions of the Checkstyle by availing option to provide the path for the jar file.

## Requirements

Your host machine or system should have Java installed. 

A minimum of Java 11 is required for the default Checkstyle jar.

If you use a Java version lower than 11, you'll need to download a suitable Checkstyle jar 
and provide the full path as an argument to the `checkstyle` hook.

## Usage

Add the following to the `.pre-commit-config.yaml` of your application

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

If you want to provide a path to a checkstyle jar of your choice, you can add the `--jar path/to/jar/file` argument:

```yaml
  - repo: https://github.com/SeunMatt/precommit4j
    rev: v0.1.0
    hooks:
      - id: checkstyle
        exclude: |
          (?x)^(
                 .*/test/.*
            )$
        args: [ "-c", "checkstyle.xml", "--jar", "path/to/jar/file"]
```

## Development

This project is written with Ruby. Ensure you have Ruby 3.4.1+ installed. 

If you encounter compilation errors when installing Ruby on macOS via RVM. 
Ensure you have a [compatible version of openssl](https://www.rubyonmac.dev/openssl-versions-supported-by-ruby) 
installed on your machine. 

Afterwards, you can run `rvm install ruby 3.4.1 --with-openssl-dir=$(brew --prefix openssl@3)`.

After checking out the repo, run `bin/setup` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`. 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SeunMatt/precommit4j.git.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
