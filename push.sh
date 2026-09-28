#!/bin/sh
# Stage, commit and push this kit to origin.
# Commits under the repository git identity only. No co-author trailer is added.
#
# Usage: ./push.sh "commit message"

set -e

cd "$(dirname "$0")"

MSG="$1"
if [ -z "$MSG" ]; then
  MSG="Update the Extended Reality course kit"
fi

git add -A

if git diff --cached --quiet; then
  echo "Nothing to commit."
else
  git commit -m "$MSG"
fi

BRANCH="$(git rev-parse --abbrev-ref HEAD)"
git push -u origin "$BRANCH"
