# Contributing to permutations

Thank you for considering contributing to `permutations`!  
Your interest in making this project better is appreciated.

## Code of conduct

Please read and adhere to our [Code of Conduct](CODE_OF_CONDUCT.md) to
maintain a safe, welcoming, and inclusive environment.

## Types of contributions

We welcome various forms of contributions:

- **Bug Reports**: Feel free to report any bugs you encounter.
- **Documentation**: Typos, clarity issues, or missing guides—-your help
  is welcome here.
- **Feature Discussions/Requests**: Got an idea? Open an issue to
  discuss its potential.
- **Code Contributions**: All code contributions are welcome, send me a
  pull request.
- **Use-cases**: If you are using the `permutations` package, let me
  know! It’s always great to see applications of mathematical software.

## Using co-authored-by in git commits

We encourage the use of [co-authored
commits](https://docs.github.com/en/github/committing-changes-to-your-project/creating-a-commit-with-multiple-authors)
for collaborative efforts. This helps in giving credit to all
contributors for their work.

``` markdown
Co-authored-by: name <name@example.com>
Co-authored-by: another-name <another-name@example.com>
```

## Development

Your contributions make this project better for everyone. Thank you for
participating!

Also don’t forget to recreate the `readme` file:
`{r eval=FALSE} devtools::build_readme()`

### Tests

Tests and checks are run on the CI, however locally one can use:

``` bash
Rscript -e 'devtools::test()'
```

#### Documentation

Ideally each change should be documented. Major changes should be
`vignettes`.
