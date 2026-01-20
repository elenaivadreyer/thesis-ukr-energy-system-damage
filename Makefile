SHELL := /bin/bash

# Virtual environment management
.PHONY: create_venv install_dev

create_venv:
	@if [ -d .venv ]; then rm -rf .venv; fi
	@echo "Creating virtual environment..."
	@python3 -m venv .venv
	@source .venv/bin/activate && \
	python3 -m pip install --upgrade pip && \
	echo "Installing development dependencies..." && \
	pip install -e .[test] --no-cache-dir && \
	echo "Virtual environment created and dependencies installed."

install_dev:
	@source .venv/bin/activate && \
	pip install -e .[test] --no-cache-dir

# Testing
.PHONY: test test_with_cov

test:
	@echo "Running tests..."
	@source .venv/bin/activate && python3 -m pytest

test_with_cov:
	@echo "Running tests with coverage..."
	@source .venv/bin/activate && \
	python3 -m pytest --cov=src/thesis_ukr_energy_system_damage --cov-report=term-missing --cov-report=xml --cov-append --cov-fail-under=0

# Linting and formatting
.PHONY: lint format check

lint:
	@source .venv/bin/activate && ruff check . --fix

format:
	@source .venv/bin/activate && ruff format

check:
	@source .venv/bin/activate && \
	ruff check . && \
	ruff format --check

# Pre-commit
.PHONY: pre_commit_install pre_commit_run

pre_commit_install:
	@source .venv/bin/activate && pre-commit install

pre_commit_run:
	@source .venv/bin/activate && pre-commit run --all-files

# Coverage badge
.PHONY: coverage_badge

coverage_badge:
	@source .venv/bin/activate && \
	coverage-badge -f -o test_coverage.svg
