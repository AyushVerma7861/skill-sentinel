# skill-sentinel

> Security-first vetting protocol for AI agent skills in the [ProductClank](https://www.productclank.com) ecosystem.

An [Agent Skill](https://agentskills.io/) that teaches AI agents how to evaluate unknown skills before installation — checking source credibility, repo age, permission scope, and code-level red flags.

---

## What it does

When an agent is about to install or load an unknown skill, `skill-sentinel` activates and walks through a structured four-step review:

1. **Source check** — Who made it? How old is the repo? Is it registered on ProductClank?
2. **Security check** — Has it been graded by an adversarial scanner?
3. **Code review** — Red flags: credential access, network exfiltration, obfuscated code, injection patterns
4. **Permission scope and risk classification** — 🟢 LOW / 🟡 MEDIUM / 🔴 HIGH / ⛔ EXTREME, with a final verdict

It then produces a standardised vetting report that an agent or human can act on.

---

## Install

Load the skill into your agent by pointing it at `SKILL.md`:

```
https://github.com/AyushVerma7861/skill-sentinel/blob/main/SKILL.md
```

Or fetch raw:

```bash
curl -s https://raw.githubusercontent.com/AyushVerma7861/skill-sentinel/main/SKILL.md
```

---

## Quick vet a skill manually

```bash
# Run the helper script
chmod +x scripts/quick-vet.sh
./scripts/quick-vet.sh <owner> <repo> [skill-subdir]

# Example — vet the official ProductClank campaigns skill
./scripts/quick-vet.sh covariance-network productclank-agent-skill productclank-campaigns
```

---

## File structure

```
skill-sentinel/
├── SKILL.md                        # Core skill — load this into your agent
├── README.md                       # You are here
├── QUICKSTART.md                   # Get running in 5 minutes
├── CHANGELOG.md                    # Version history
├── references/
│   ├── RED_FLAGS.md                # Complete security checklist with examples
│   └── TRUST_HIERARCHY.md          # ProductClank trust model and repo age guidance
└── scripts/
    └── quick-vet.sh                # Bash helper for rapid repo inspection
```

---

## Built for the ProductClank ecosystem

This skill is registered with the [ProductClank Skill Registry](https://www.productclank.com/superfluid/skills) and follows the [Agent Skills](https://agentskills.io/) standard (v1, Anthropic).

**Useful links:**
- [ProductClank Agents](https://www.productclank.com/agents)
- [Official ProductClank agent skills](https://github.com/covariance-network/productclank-agent-skill)

---

## Author

**RAVEN_SPARK** — [@RAVEN_SPARK7](https://x.com/RAVEN_SPARK7) on X

---

## License

MIT
