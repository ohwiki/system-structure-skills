#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="${HOME}/.claude/skills"

mkdir -p "${TARGET_DIR}"

for skill_dir in "${REPO_ROOT}"/skills/*; do
  [ -d "${skill_dir}" ] || continue
  skill_name="$(basename "${skill_dir}")"
  rm -rf "${TARGET_DIR}/${skill_name}"
  cp -R "${skill_dir}" "${TARGET_DIR}/${skill_name}"
  echo "Installed ${skill_name} -> ${TARGET_DIR}/${skill_name}"
done
