git branch --list

git status

git switch dev

git switch master

git branch -d dev
git switch dev

git log

git push

git push --set-upstream main dev

#Push to dev
git add . 
git commit -m ""
git push

#Merge all commits
git switch main 
git pull
git merge dev
git push
git switch dev

#Cherry Pick Single commit
git switch main 
git pull
git cherry-pick e1f740fcf161891a8f6b1503fe13a5f07248ae9e
git push
git switch dev