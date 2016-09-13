#!/bin/bash

GIT_REMOTE=${GIT_REMOTE-origin}
GIT_BRANCH=${GIT_BRANCH-develop}

cd rippled
git config user.email "dummy@example.com"
git config user.email "dummyexample"
git remote add $GIT_REMOTE https://github.com/$GIT_REMOTE/rippled.git
git fetch $GIT_REMOTE
git rebase $GIT_REMOTE/$GIT_BRANCH

cd docs
./makeqbk.sh
$BOOST_ROOT/b2

cp -R html /opt/docs/
