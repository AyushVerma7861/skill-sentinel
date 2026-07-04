# Changelog

All notable changes to `skill-sentinel` are documented here.

## [1.0.0] — 2026-07-03 — 2026-07-03

### Added
- Initial release of `skill-sentinel` for the ProductClank ecosystem
- Four-step vetting protocol: source check, code review, permission scope, risk classification
- Structured vetting report output format
- `references/RED_FLAGS.md` — complete security checklist with examples
- `references/TRUST_HIERARCHY.md` — ProductClank trust model, repo age guidance, official resource list
- `scripts/quick-vet.sh` — bash helper for rapid repo inspection via GitHub API
- Hardened against tool-output injection: vetting report is analysis, not executable instruction
- Declared API endpoint matches actual usage: read-only GitHub API only
- No credential access, no data transmission, no destructive commands

### Follows
- [Agent Skills](https://agentskills.io/) standard v1 (Anthropic)
- ProductClank Skill Registry — Season 6
