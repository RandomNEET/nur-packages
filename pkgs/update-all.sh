#!/usr/bin/env bash
set -euo pipefail

# 保留原有入口
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
exec bash "$SCRIPT_DIR/scripts/update-all.sh" "$@"
