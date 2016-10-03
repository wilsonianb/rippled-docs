#!/bin/bash

GIT_REMOTE=${GIT_REMOTE-origin}
GIT_BRANCH=${GIT_BRANCH-develop}

cd rippled
git config user.email "dummy@example.com"
git remote add $GIT_REMOTE https://github.com/$GIT_REMOTE/rippled.git
git fetch $GIT_REMOTE
git rebase $GIT_REMOTE/$GIT_BRANCH

git rm --cached src/nudb/doc/docca src/nudb/extras/beast src/nudb/extras/rocksdb
git submodule update --init

cd docs
chmod +x makeqbk.sh
./makeqbk.sh
$BOOST_ROOT/b2

cp -R html /opt/docs/
