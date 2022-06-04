#!/bin/bash


COMMIT_MSG='행렬을 이용한 피보나치 수열 !! 신기하다'

echo ${COMMIT_MSG}

git checkout -b source
git branch -D main
git add .
git commit -m "${COMMIT_MSG}"
git checkout -b main
git filter-branch --subdirectory-filter _site -f HEAD
git add .
git commit -m "${COMMIT_MSG}"
git push --all
git push -u origin main --force
git checkout source