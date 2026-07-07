#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"
UV_PROJECT_ENVIRONMENT="$HOME/.virtualenvs/neovim" uv sync --frozen
