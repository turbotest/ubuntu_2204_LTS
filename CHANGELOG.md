# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

https://github.com/turbotest/ubuntu_2204_LTS/compare/v0.1...HEAD

### Added
### Changed
### Deprecated
### Fixed
### Removed
### Security

## [0.2] - 2024-02-22
### Added
* Build system using ruby rake
* Two phase build process: 1) release candidate 2) production release
* Run unit tests for operating system configuration on release candidate
* Don't release production operating system unless release candidate tests pass

### Changed
* Build release candidate GCE images or vagrant boxes
* Verify release candidates & create general release GCE images or vagrant boxes

### Fixed
* PostgreSQL cluster staring all available versions on different ports.
* Start PostgreSQL server with version: `sudo systemctl enable --now postgresql@16-main.service`
* You can only start one PostgreSQL server at a time.


## [0.1] - 2024-02-13

https://github.com/turbotest/ubuntu_2204_LTS/releases/tag/v0.1

### Added
* Base box installation scripts
* Released to vagrant cloud
