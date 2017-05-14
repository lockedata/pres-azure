#!/bin/bash
AUTHORNAME="Steph"
AUTHOREMAIL="Steph@itsalocke.com"
GITURL="https://$GITHUB_PAT@github.com/$TRAVIS_REPO_SLUG.git"

git remote set-url origin $GITURL
git config --global user.name $AUTHORNAME
git config --global user.email $AUTHOREMAIL

R CMD BATCH './buildpres.R'

cp buildpres.Rout docs

git add .
git commit -am "[ci skip] Documents produced in clean environment via Travis $TRAVIS_BUILD_NUMBER"
git push -u  --quiet origin master
