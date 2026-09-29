#!/usr/bin/env bash
# Publishes the privacy policy to GitHub Pages.
#
#   ./deploy.sh <github-username> <repo-name>
#
# Needs a deploy key added to your GitHub account, and the repo created first
# (empty, public, with a README). Enabling Pages is a one-click setting in the
# repo, because GitHub exposes no git-level switch for it.
set -euo pipefail

USER_NAME="${1:?usage: deploy.sh <github-username> <repo-name>}"
REPO="${2:?usage: deploy.sh <github-username> <repo-name>}"
REMOTE="git@github.com:${USER_NAME}/${REPO}.git"
HERE="$(cd "$(dirname "$0")" && pwd)"
PARENT="$(dirname "$HERE")"

cd "$HERE"

if [[ ! -d .git ]]; then
  echo "initialising repository"
  git init -q
  git branch -M main
fi

git add index.html README.md
if git diff --cached --quiet; then
  echo "nothing to commit"
else
  git -c user.name="CookSmart" -c user.email="noreply@github.com" \
      commit -q -m "Publish CookSmart privacy policy"
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  git remote add origin "$REMOTE"
fi

echo "pushing to $REMOTE"
git push -u origin main

echo
echo "Now, once, in the browser:"
echo "  https://github.com/${USER_NAME}/${REPO}/settings/pages"
echo "  Source: Deploy from a branch"
echo "  Branch: main / (root)"
echo
echo "It will be live within a minute at:"
echo "  https://${USER_NAME}.github.io/${REPO}/"
