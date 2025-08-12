.PHONY: help install install-dev test test-cov test-fast lint format type-check clean build upload upload-test docs verify example

# Default target
help:
	@echo "Available commands:"
	@echo "  make install       - Install the package in production mode"
	@echo "  make install-dev   - Install the package in development mode with all dependencies"
	@echo "  make test          - Run all tests"
	@echo "  make test-cov      - Run tests with coverage report"
	@echo "  make test-fast     - Run tests in parallel"
	@echo "  make lint          - Check code style with ruff"
	@echo "  make format        - Format code with black and isort"
	@echo "  make type-check    - Check types with mypy"
	@echo "  make clean         - Remove build artifacts and cache files"
	@echo "  make build         - Build distribution packages"
	@echo "  make upload        - Upload to PyPI (requires credentials)"
	@echo "  make upload-test   - Upload to Test PyPI"
	@echo "  make docs          - Build documentation"
	@echo "  make verify        - Run accuracy verification tests"
	@echo "  make example       - Run example script"
	@echo "  make all           - Run format, lint, type-check, and test"

# Installation targets
install:
	pip install -e .

install-dev:
	pip install -e ".[dev,test,docs]"
	pre-commit install

# Testing targets
test:
	pytest tests/ -v

test-cov:
	pytest tests/ --cov=utci --cov-report=html --cov-report=term-missing

test-fast:
	pytest tests/ -n auto

# Code quality targets
lint:
	ruff check src/utci tests

format:
	black src/utci tests examples
	isort src/utci tests examples
	ruff check src/utci tests --fix

type-check:
	mypy src/utci

# Cleaning targets
clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf src/*.egg-info
	rm -rf .pytest_cache/
	rm -rf .mypy_cache/
	rm -rf .ruff_cache/
	rm -rf htmlcov/
	rm -rf .coverage
	rm -rf coverage.xml
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type f -name "*~" -delete

# Build and distribution targets
build: clean
	python -m build

upload: build
	twine check dist/*
	twine upload dist/*

upload-test: build
	twine check dist/*
	twine upload --repository testpypi dist/*

# Documentation targets
docs:
	@echo "Documentation building not yet configured"
	@echo "To set up documentation:"
	@echo "  1. Create docs/ directory"
	@echo "  2. Run: sphinx-quickstart"
	@echo "  3. Configure docs/conf.py"
	@echo "  4. Write documentation in docs/"

# Utility targets
verify:
	python tests/verify_accuracy.py

example:
	python examples/example.py

# Combined targets
all: format lint type-check test

# Development workflow shortcuts
check: lint type-check test-fast

fix: format lint

# Watch for changes and run tests (requires pytest-watch)
watch:
	@command -v ptw >/dev/null 2>&1 || (echo "Installing pytest-watch..." && pip install pytest-watch)
	ptw tests/ -- -v

# Create a new release
release:
	@echo "To create a new release:"
	@echo "  1. Update version in src/utci/_version.py"
	@echo "  2. Update CHANGELOG.md"
	@echo "  3. Commit changes: git commit -m 'Release v<version>'"
	@echo "  4. Create tag: git tag v<version>"
	@echo "  5. Push: git push origin main --tags"
	@echo "  6. Create GitHub release from tag"