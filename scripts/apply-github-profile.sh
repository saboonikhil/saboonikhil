#!/usr/bin/env sh
# Apply profile bio, kahwa About metadata. Pin repos via GitHub UI (no public API).
set -e

if ! command -v gh >/dev/null 2>&1; then
  echo "Install GitHub CLI: brew install gh && gh auth login"
  exit 1
fi

gh auth status >/dev/null 2>&1 || {
  echo "Run: gh auth login"
  exit 1
}

echo "Updating profile bio and website..."
gh api -X PATCH user \
  -f bio='Full-stack · automation & integrations · open source. Building Kahwa (self-hosted WhatsApp workflows). Open to collaborate.' \
  -f blog='https://github.com/saboonikhil/kahwa'

echo "Updating kahwa repository About..."
gh repo edit saboonikhil/kahwa \
  --description 'Open-source self-hosted WhatsApp Web dashboard with workflows. Node.js + PostgreSQL. Contributions welcome.' \
  --add-topic whatsapp \
  --add-topic whatsapp-web \
  --add-topic nodejs \
  --add-topic typescript \
  --add-topic postgresql \
  --add-topic prisma \
  --add-topic self-hosted \
  --add-topic open-source \
  --add-topic workflow-automation

echo ""
echo "Done (API). Pin these 6 repos manually on your profile:"
echo "  1. kahwa  2. Recruitments  3. Gait-Assessment"
echo "  4. Recruitments_backend  5. apps  6. SimpleWhaleDemo"
echo "  https://github.com/saboonikhil → Customize your pins"
