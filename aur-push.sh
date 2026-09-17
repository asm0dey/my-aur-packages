#!/bin/sh
# Push one package dir to AUR as ONE commit on top of AUR's master.
# usage: aur-push.sh fselect   (runs from anywhere inside the repo)
# ponytail: no subtree. aurpublish's --rejoin markers leak across prefixes and
# drag the monorepo root (no PKGBUILD) into the split; AUR's hook rejects it.
set -e
p=${1:?usage: aur-push.sh PKGDIR}
cd "$(dirname "$0")"
test -f "$p/.SRCINFO" || { echo "no $p/.SRCINFO in $PWD" >&2; exit 1; }
pkgbase=$(sed -rn 's/pkgbase = (.*)/\1/p' "$p/.SRCINFO") || true
pkgbase=${pkgbase:-$p}
git remote add "aur-$p" "ssh://aur@aur.archlinux.org/$pkgbase.git" 2>/dev/null || true
# new package on AUR has no master yet: fetch fails, push with no parent
if git fetch "aur-$p" master; then parent="-p FETCH_HEAD"; else parent=""; fi
c=$(git commit-tree "$(git rev-parse "HEAD:$p")" $parent -m "$(git log -1 --format=%s -- "$p")")
git push "aur-$p" "$c:master"
