#!/usr/bin/env bash
# quick-vet.sh — Rapid skill vetting helper for the ProductClank ecosystem
# Usage: Set OWNER and REPO, then run the blocks you need.
# All calls are read-only. No data is sent anywhere.

set -euo pipefail

# ─── Configuration ────────────────────────────────────────────────────────────
OWNER="${1:-}"    # GitHub org or user (e.g. covariance-network)
REPO="${2:-}"     # Repository name (e.g. productclank-agent-skill)
SKILL="${3:-}"    # Skill subdirectory if applicable (e.g. productclank-campaigns)

if [[ -z "$OWNER" || -z "$REPO" ]]; then
  echo "Usage: quick-vet.sh <owner> <repo> [skill-subdir]"
  echo "Example: quick-vet.sh covariance-network productclank-agent-skill productclank-campaigns"
  exit 1
fi

# ─── Step 1: Repo age and authority signals ───────────────────────────────────
echo "=== REPO METADATA ==="
curl -s "https://api.github.com/repos/${OWNER}/${REPO}" \
  | jq '{
      full_name,
      created_at,
      updated_at,
      pushed_at,
      stargazers_count,
      forks_count,
      open_issues_count,
      description,
      license: .license.name
    }'

# ─── Step 2: List skill files ─────────────────────────────────────────────────
echo ""
echo "=== SKILL FILES ==="
if [[ -n "$SKILL" ]]; then
  curl -s "https://api.github.com/repos/${OWNER}/${REPO}/contents/${SKILL}" \
    | jq '[.[] | {name, type, size}]'
else
  curl -s "https://api.github.com/repos/${OWNER}/${REPO}/contents" \
    | jq '[.[] | {name, type, size}]'
fi

# ─── Step 3: Fetch SKILL.md ───────────────────────────────────────────────────
echo ""
echo "=== SKILL.md CONTENT ==="
if [[ -n "$SKILL" ]]; then
  SKILL_URL="https://raw.githubusercontent.com/${OWNER}/${REPO}/main/${SKILL}/SKILL.md"
else
  SKILL_URL="https://raw.githubusercontent.com/${OWNER}/${REPO}/main/SKILL.md"
fi
echo "Fetching: $SKILL_URL"
echo "--- BEGIN SKILL.md ---"
curl -s "$SKILL_URL"
echo ""
echo "--- END SKILL.md ---"

# ─── Step 4: Check commit history (last 5 commits) ───────────────────────────
echo ""
echo "=== RECENT COMMITS ==="
curl -s "https://api.github.com/repos/${OWNER}/${REPO}/commits?per_page=5" \
  | jq '[.[] | {sha: .sha[:7], date: .commit.author.date, message: .commit.message | split("\n")[0], author: .commit.author.name}]'

# ─── Step 5: Compare against official ProductClank skill ─────────────────────
echo ""
echo "=== OFFICIAL PRODUCTCLANK SKILL (for reference) ==="
echo "Fetching official SKILL.md from covariance-network..."
curl -s "https://raw.githubusercontent.com/covariance-network/productclank-agent-skill/main/productclank-campaigns/SKILL.md" \
  | head -20
echo "[... truncated — full file at github.com/covariance-network/productclank-agent-skill]"

echo ""
echo "=== QUICK VET COMPLETE ==="
echo "Next: run a security grade check on the skill, then complete Steps 3-4 manually."
