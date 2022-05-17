git checkout -b source
git branch -D main
git add .
git commit -m "토이 프로젝트의 요구사항 분석을 해보자."
git checkout -b main
git filter-branch --subdirectory-filter _site -f HEAD
git add .
git commit -m "토이 프로젝트의 요구사항 분석을 해보자."
git push --all
git push -u origin main --force
git checkout source