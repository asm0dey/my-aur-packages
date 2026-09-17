#!/bin/sh
# Repair aurpublish for ONE package: plant a fresh subtree rejoin marker pointing
# at AUR's current master, so `git subtree split` stops there instead of walking
# into another package's rejoin merge and dragging in the monorepo root.
# usage: aur-rejoin.sh fselect     (run aur-push.sh first; then aurpublish works)
set -e
p=${1:?usage: aur-rejoin.sh PKGDIR}
cd "$(dirname "$0")"
test -f "$p/.SRCINFO" || { echo "no $p/.SRCINFO in $PWD" >&2; exit 1; }
pkgbase=$(sed -rn 's/pkgbase = (.*)/\1/p' "$p/.SRCINFO") || true
pkgbase=${pkgbase:-$p}
git remote add "aur-$p" "ssh://aur@aur.archlinux.org/$pkgbase.git" 2>/dev/null || true
git fetch "aur-$p" master
split=$(git rev-parse FETCH_HEAD)
# refuse to plant a lying marker
test "$(git rev-parse "$split^{tree}")" = "$(git rev-parse "HEAD:$p")" ||
  { echo "AUR master tree != HEAD:$p -- run aur-push.sh $p first" >&2; exit 1; }
head=$(git rev-parse HEAD)
git merge --ff-only "$(git commit-tree "$head^{tree}" -p "$head" -p "$split" -m "Split '$p/' into commit '$split'

git-subtree-dir: $p
git-subtree-mainline: $head
git-subtree-split: $split
")"
