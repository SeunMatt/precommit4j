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
    rev: v2.2.0
    hooks:
      - id: checkstyle
        exclude: |
          (?x)^(
                 .*/test/.*
            )$
        args: [ "-c", "checkstyle.xml"]
```

## Development

The plugin is now built with Python and expects you to have Python v3+ on your local machine.

To install the Python package onto your local machine, run `pip3 install -e .` 
Use `pip3 install .` to install it in non-editable mode. This is closest to how it will be installed on 
end-users machine.

To uninstall the Python package, run `pip3 uninstall precommit4j`


To release a new version: 
- Update the version number in `__init__.py` and [pyproject.toml](pyproject.toml)
- Create a git tag for the version using `git tag v2.x.x`
- Push the git tags `git push --tags`
- Run the build `python3 -m build`
- Upload the distribution using `twine upload dist/*` which will upload the distribution to https://pypi.org

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SeunMatt/precommit4j.git.

## License

The Python package is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## CHANGE LOG

### v2.2.0
- Fixed bug on Windows machine where the packaged checkstyle.jar is not found

### v2.0.0
- Switched from using Ruby on Rails to Python to reduce the dependencies required when using it in a CI/CD pipeline

### v1.0.0
- The initial version