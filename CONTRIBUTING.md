# Contributing to UTCI

Thank you for your interest in contributing to the UTCI Python implementation! We welcome contributions from the community and are grateful for any help you can provide.

## Code of Conduct

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms.

## How to Contribute

### Reporting Issues

If you find a bug or have a suggestion for improvement:

1. Check if the issue already exists in the [issue tracker](https://github.com/marvell/utci/issues)
2. If not, create a new issue with a clear title and description
3. Include relevant information:
   - Python version
   - Operating system
   - Minimal code example to reproduce the issue
   - Error messages and stack traces

### Submitting Pull Requests

1. **Fork the repository** and create your branch from `main`:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Set up your development environment**:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   pip install -e ".[dev,test]"
   pre-commit install
   ```

3. **Make your changes**:
   - Write clear, concise code following the existing style
   - Add or update tests as needed
   - Update documentation if necessary
   - Follow the commit message guidelines below

4. **Run the tests and checks**:
   ```bash
   make format     # Format code
   make lint       # Check code style
   make type-check # Check types
   make test       # Run tests
   ```

5. **Commit your changes** with a descriptive message:
   ```bash
   git commit -m "feat: add new feature X"
   ```

6. **Push to your fork** and submit a pull request:
   ```bash
   git push origin feature/your-feature-name
   ```

### Commit Message Guidelines

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes (formatting, etc.)
- `refactor:` Code refactoring
- `test:` Test additions or changes
- `chore:` Maintenance tasks
- `perf:` Performance improvements

Examples:
```
feat: add support for vectorized operations
fix: correct vapor pressure calculation for edge cases
docs: update installation instructions
test: add tests for extreme temperature scenarios
```

## Development Guidelines

### Code Style

- Follow PEP 8 with a line length limit of 100 characters
- Use type hints for all function signatures
- Write descriptive docstrings for all public functions and classes
- Use meaningful variable and function names

### Testing

- Write tests for all new functionality
- Ensure all tests pass before submitting a PR
- Aim for high test coverage (>90%)
- Test edge cases and error conditions

### Documentation

- Update README.md if adding new features
- Add docstrings to all public APIs
- Include examples in docstrings when helpful
- Update CHANGELOG.md with your changes

## Development Workflow

1. **Create an issue** discussing the change you want to make
2. **Fork and clone** the repository
3. **Create a branch** for your changes
4. **Make changes** following the guidelines above
5. **Test thoroughly** including edge cases
6. **Update documentation** as needed
7. **Submit a PR** with a clear description
8. **Respond to feedback** during code review

## Testing

### Running Tests

```bash
# Run all tests
make test

# Run with coverage
make test-cov

# Run specific test file
pytest tests/test_utci.py

# Run tests in watch mode
make watch
```

### Writing Tests

- Place tests in the `tests/` directory
- Name test files with `test_` prefix
- Use descriptive test function names
- Test both normal cases and edge cases
- Use fixtures for common test data

## Documentation

### Building Documentation

```bash
# Build HTML documentation (when configured)
make docs
```

### Writing Documentation

- Use clear, simple language
- Include code examples
- Explain the "why" not just the "how"
- Keep examples realistic and useful

## Release Process

Releases are managed by maintainers. The process is:

1. Update version in `src/utci/_version.py`
2. Update CHANGELOG.md
3. Create a git tag: `git tag v1.0.0`
4. Push tag: `git push origin v1.0.0`
5. GitHub Actions will automatically publish to PyPI

## Questions?

If you have questions about contributing, feel free to:

- Open an issue for discussion
- Ask in the pull request
- Contact the maintainers

## Recognition

Contributors will be recognized in:
- The CHANGELOG.md file
- The GitHub contributors page
- Release notes

Thank you for contributing to UTCI!