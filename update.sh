git checkout -b source
git branch -D main
git add .
git commit -m "jekyll upload"
git checkout -b main
git filter-branch --subdirectory-filter _site -f HEAD
git add .
git commit -m "jekyll"
git push --all
git push -u origin main --force
git checkout -b source