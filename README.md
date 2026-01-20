# thesis_ukr_energy_system_damage

#### 

```
The user/developer writes a brief introduction about the project repository here.
What modules it consists of, what for, and any hints/tips that would help other
users/developers to use this package.
```

How to use this package or its modules directly, please refer to [notebooks/sample_thesis_ukr_energy_system_damage.ipynb](./notebooks/sample_thesis_ukr_energy_system_damage.ipynb)

## Structure
* `src/thesis_ukr_energy_system_damage`: this is considered a package as `thesis_ukr_energy_system_damage`.
* `tests`: this is considered a test folder to test the contents of a package `thesis_ukr_energy_system_damage`. Please note, test folder and its subfolders must not have `__init__.py`.
* `tests/test_thesis_ukr_energy_system_damage.py`: Example calls of the very package `thesis_ukr_energy_system_damage`.
* If other modules are available, separate test files (one test file per module) are expected to be set up.


## Accessing Virtual Environment in Codespaces
For bash terminal users wanting to work in a virtual environment of thesis_ukr_energy_system_damage, enter these commands:

```
cd /workspaces/thesis_ukr_energy_system_damage
source .venv/bin/activate
```


### Accessing Database in Codespaces
PostgreSQL Database can be set up inside the Codespace Development Container. The configuration in `.devcontainer/devcontainer.json` includes:
* `project_db`: Project-Testing with schema `dev` and in future cases `prod`.

To use PostgreSQL in Codespaces, you'll need to install it manually or add installation commands to your devcontainer setup. Login to the database with:
```
host:       127.0.0.1 (or: localhost)
Port:       5432
Username:   project_user
Password:   project_pass
Database:   project_db
```


## Linting and Formatting
This project uses [Ruff](https://docs.astral.sh/ruff/) for linting and formatting, integrated via pre-commit hooks. Ruff lints both Python files and Jupyter notebooks.

### Installation
After setting up your virtual environment:
```bash
make pre_commit_install
# or manually:
pre-commit install
```

### Running Linting
**Pre-commit hooks** (automatic on commit):
```bash
pre-commit run --all-files
```

**Manual linting** (using Ruff directly):
```bash
# Check and auto-fix issues
ruff check . --fix
ruff format

# Or use make commands
make lint    # Check and auto-fix
make format  # Format code
make check   # Check without fixing
```

### Skipping Pre-commit on Feature Branches
When working on feature branches, you can skip pre-commit hooks if needed:
```bash
# Skip all pre-commit hooks for a single commit
git commit --no-verify -m "WIP: feature in progress"

# Temporarily disable pre-commit hooks
pre-commit uninstall

# Re-enable when ready
pre-commit install
```

**Note:** Pre-commit hooks are recommended but not enforced on feature branches. Always run linting before merging to main.

### Configuration
Ruff configuration is in `pyproject.toml`. To exclude specific rules:
```toml
[tool.ruff.lint]
ignore = [
    "E722"  # example: ignore bare except
]
```

For Jupyter notebooks specifically, Ruff handles them automatically. No additional configuration needed.