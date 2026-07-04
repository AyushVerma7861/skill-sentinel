# skill-sentinel

> Security-first vetting protocol for AI agent skills in the [ProductClank](https://www.productclank.com) ecosystem.

An [Agent Skill](https://agentskills.io/) that teaches AI agents how to evaluate unknown skills before installation — checking source credibility, repo age, permission scope, and code-level red flags.

---

## What it does

When an agent is about to install or load an unknown skill, `skill-sentinel` activates and walks through a structured five-step review:

1. **Source check** — Who made it? How old is the repo? Is it registered on ProductClank?
2. **Code review** — Red flags: credential access, network exfiltration, obfuscated code, injection patterns
3. **Permission scope** — Is the access footprint minimal for what the skill claims to do?
4. **Risk classification** — 🟢 LOW / 🟡 MEDIUM / 🔴 HIGH / ⛔ EXTREME, with a final verdict

It then produces a standardised vetting report that an agent or human can act on.

---

## Install

Load the skill into your agent by pointing it at `SKILL.md`:

```
https://github.com/YOUR_GITHUB/YOUR_REPO/blob/main/skill-sentinel/SKILL.md
```

Or fetch raw:

```bash
curl -s https://raw.githubusercontent.com/YOUR_GITHUB/YOUR_REPO/main/skill-sentinel/SKILL.md
```

---

## Quick vet a skill manually

```bash
# Clone and run the helper script
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

Security checks in `references/RED_FLAGS.md` align with the four Polygraph adversarial check categories (C-01 through C-04) used by [polygraph.so](https://polygraph.so).

**Useful links:**
- [ProductClank Agents](https://www.productclank.com/agents)
- [Skill Registry — Season 6](https://www.productclank.com/superfluid/skills)
- [Skill-Leads programme](https://www.productclank.com/skill-leads)
- [Official ProductClank agent skills](https://github.com/covariance-network/productclank-agent-skill)

---

## Author

**RAVEN_SPARK** — [@RAVEN_SPARK7](https://x.com/RAVEN_SPARK7) on X

---

## License

MIT
