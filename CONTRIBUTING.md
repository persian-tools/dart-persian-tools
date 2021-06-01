# Contributing to Persian Tools

🎉 First off, thanks for taking the time to contribute! 🎉

The following is a set of steps for contributing to Dart version of Persian tools package.

## Proposing a Change

If you intend to change the public API, or make any non-trivial changes
to the implementation, we recommend `filing an issue`.
This lets us reach an agreement on your proposal before you put significant
effort into it.

if you're fixing a bug you need to mention that issue in your PR. This helps us to understand exactly what you are working on.

## Creating a Pull Request

Before creating a pull request please:

1. First of all make sure you have installed dart SDK on your machine. 
1. Fork the repository.
1. use `git clone` to clone the project.
1. create your branch from `dev`. we use `master` branch only for production. all development changes should submitted to `dev` branch ( For the Branch name, please [Follow this Convention](https://dev.to/couchcamote/git-branching-name-convention-cch "Follow this Convention") ).
1. Install all dependencies (`flutter packages get` or `pub get`).
1. Squash your commits and ensure you have a meaningful commit message ( for the commit messages, please [follow this convention](https://www.conventionalcommits.org/en/v1.0.0/ "follow this convention") ).
1. If you’ve fixed a bug or added code that should be tested, add tests!
Pull Requests without 100% test coverage will not be approved.
1. Ensure the test suite passes ( `dart test .` ).
1. If you've changed the public API, make sure to update/add documentation.
1. Format your code (`dart format .`).
1. Analyze your code (`dartanalyzer --fatal-infos --fatal-warnings .`).
1. Create the Pull Request.

## Adding Documentation

If you are creating/changing the public API please make sure that the public methods, classes and variables has documentation.
You should also change the `README.md` file if the changes related to it.

## Adding an example

If you are creating/changing the public API, you should create/update example for it. example should placed in `/example` directory and the name of  the example file must be similar to the following name.
`example/example_feature_name.dart`.

## License

By contributing to Bloc, you agree that your contributions will be licensed
under its [MIT license](LICENSE).
