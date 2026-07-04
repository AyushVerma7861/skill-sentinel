# Quickstart — skill-sentinel

Get the skill running in under 5 minutes.

## 1. Load the skill

Point your agent at `SKILL.md`. In most agent environments:

```
.agents/skills/skill-sentinel/SKILL.md
```

Or fetch it raw and pass it to your agent's skill loader:

```bash
curl -s https://raw.githubusercontent.com/YOUR_GITHUB/YOUR_REPO/main/skill-sentinel/SKILL.md
```

## 2. Trigger it

Ask your agent:

> "Vet this skill before I install it: [GitHub URL or SKILL.md content]"

Or just paste a SKILL.md and ask:

> "Is this skill safe to install in my ProductClank agent?"

The skill will activate and begin the five-step protocol automatically.

## 3. Run a quick vet from the terminal

Use the bundled helper script to pull repo metadata and fetch SKILL.md in one go:

```bash
chmod +x scripts/quick-vet.sh

# Vet any skill by owner/repo
./scripts/quick-vet.sh covariance-network productclank-agent-skill productclank-campaigns
```

Output includes: repo age, star/fork count, file list, SKILL.md content, and recent commit history.

## 4. Read the report

The agent produces a structured vetting report:

```
SKILL VETTING REPORT
═══════════════════════════════════════════════
Skill:         example-skill
Source:        github.com/someone/example-skill
Author:        someone
Version:       1.0.0
Repo created:  2025-07-01
───────────────────────────────────────────────
RED FLAGS:     None found

PERMISSIONS:
  Files:    Read-only within skill directory
  Network:  https://api.productclank.com/api/v1
  Commands: curl, jq
  PC API:   /agents/me (GET)
───────────────────────────────────────────────
RISK LEVEL:  🟢 LOW

VERDICT:  ✅ SAFE TO INSTALL

NOTES:
Repo is 12 months old with 8 stars.
No red flags found in code review. Permission scope is minimal.
═══════════════════════════════════════════════
```

## Reference files

If you need to go deeper:

- `references/RED_FLAGS.md` — full security checklist with examples for each Polygraph check category
- `references/TRUST_HIERARCHY.md` — ProductClank trust model, repo age guidance, and official resource list
