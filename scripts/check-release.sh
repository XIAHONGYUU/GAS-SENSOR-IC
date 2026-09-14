#!/usr/bin/env bash
# Checks the public release candidate for identity and obvious leakage.
# Run: bash scripts/check-release.sh
# Needs: bash, sha256sum, rg, find, git (optional).

set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
expected_html_hash="9eed47cf14fdd7629d4f5c148e1cee83be1825bbb1a9c9f114a5a0bd02e43ba6"

cd "$repo_dir"

actual_html_hash="$(sha256sum site/index.html | awk '{print $1}')"
if [[ "$actual_html_hash" != "$expected_html_hash" ]]; then
  echo "FAIL: site/index.html hash mismatch" >&2
  exit 1
fi

required=(
  README.md
  CONTRIBUTING.md
  DISCLAIMER.md
  LICENSE
  LICENSE-CODE
  PUBLICATION_GATE.md
  THIRD_PARTY_NOTICES.md
  CITATION.cff
  .github/workflows/pages.yml
  docs/project-discussion-summary.md
  docs/interface-chip-research-introduction.md
  docs/design-rationale.md
  docs/evidence-boundaries.md
  docs/presentation-workflow-retrospective.md
  site/index.html
)

for path in "${required[@]}"; do
  [[ -f "$path" ]] || { echo "FAIL: missing $path" >&2; exit 1; }
done

if rg -n '/home/|/mnt/c|C:\\Users|resume-workspace|CURRENT_TASK\.md|state/checkpoints' \
  README.md CONTRIBUTING.md DISCLAIMER.md LICENSE \
  THIRD_PARTY_NOTICES.md docs quarto-report .github; then
  echo "FAIL: internal path or workspace reference found" >&2
  exit 1
fi

if find . -type f -size +95M -print -quit | grep -q .; then
  echo "FAIL: file larger than 95 MiB" >&2
  exit 1
fi

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git diff --check
fi

echo "PASS: public release candidate checks"
