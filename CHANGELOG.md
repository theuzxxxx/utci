# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Comprehensive documentation in README.md
- GitHub Actions workflows for CI/CD
- Pre-commit hooks configuration
- Makefile for development tasks
- Type hints throughout the codebase
- Support for Python 3.8 - 3.12

### Changed
- Restructured project to follow modern Python packaging standards
- Moved source code to `src/utci/` directory
- Moved tests to `tests/` directory
- Updated project configuration to use `pyproject.toml`

## [1.0.0] - 2024-12-01

### Added
- Initial release of UTCI Python implementation
- Exact numerical translation from Fortran code (Version a 0.002, October 2009)
- Core functions:
  - `utci_approx()` - Calculate UTCI using polynomial approximation
  - `rh_to_vp()` - Convert relative humidity to vapor pressure
  - `es()` - Calculate saturation vapor pressure
- 6th-order polynomial approximation with 210 coefficients
- Hardy's ITS-90 formulation for vapor pressure calculation
- Comprehensive test suite with TDD approach
- Validation against reference test cases
- Example usage scripts
- Full documentation with docstrings

### Features
- Input validation for all parameters
- Support for wide range of meteorological conditions:
  - Air temperature: -50 to +50 °C
  - Mean radiant temperature: ta-30 to ta+70 °C
  - Wind speed: 0.5 to 17 m/s
  - Water vapor pressure: 0 to 50 hPa
- Returns NaN for inputs outside valid ranges

### Attribution
Based on the original UTCI Fortran code by:
- Peter Bröde
- Dusan Fiala
- Krzysztof Błażejczyk
- Igor Holmér
- Gerd Jendritzky
- Bernhard Kampmann
- Members of COST Action 730

Reference: Bröde et al. (2012) Int J Biometeorol 56(3):481-494. doi:10.1007/s00484-011-0454-1

[Unreleased]: https://github.com/marvell/utci/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/marvell/utci/releases/tag/v1.0.0