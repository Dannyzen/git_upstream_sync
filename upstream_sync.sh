#!/bin/sh
set -o errexit

upstreamrepo="tldr-pages/tldr"
myrepo="dannyzen/tldr"
dirname="repo"
upstreambranch="master"
myrepobranch="master"

echo "DEBUG: Ya'll gonna fail cus ssh keys"

# If there is no repo clone in 
if [ ! -d "$dirname" ]; then
  git clone git@github.com:"$myrepo".git $dirname 
fi

cd $dirname

#Add the upstream and if it fails that's fine, i dont care, then pull in the upstream 
git remote add upstream git@github.com:"$upstreamrepo" 2>/dev/null || git pull upstream "$upstreambranch" -f --no-edit
echo "-------pulled upstream"
git push origin "$myrepobranch" -f
echo "-------force pushed to master, lol"
