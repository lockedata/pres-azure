#!/bin/bash
AUTHORNAME="Steph"
AUTHOREMAIL="Steph@itsalocke.com"
GITURL="https://$GITHUB_PAT@github.com/$TRAVIS_REPO_SLUG.git"

git config --global user.name $AUTHORNAME
git config --global user.email $AUTHOREMAIL

cd pres-azure
git remote set-url origin $GITURL
git pull
git checkout master

R -e 'install.packages("devtools")'
R -e 'devtools::install_deps(dep = T)'
R CMD build --no-build-vignettes --no-manual .
R CMD check --no-build-vignettes --no-manual  *tar.gz
Rscript -e 'devtools::install(pkg = ".")'

R CMD BATCH './buildpres.R'

cp buildpres.Rout docs/

git add docs/
git commit -am "[ci skip] Documents produced in clean environment via Travis $TRAVIS_BUILD_NUMBER"
git push -u  --quiet origin master
