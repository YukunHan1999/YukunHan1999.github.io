# PARA信息管理数据源头维护
sudo rm -rf ./para/*
sudo mv /workspace/dev/rust_dev/workspace/github.com/YukunHan1999/para/docs/* ./para/

# 清空所有历史提交记录后提交
git checkout --orphan tmp;git rm -rf --cached .;git add -A;git commit -m "deploy";git branch -D main;git branch -m main;git push -f origin main;git branch --set-upstream-to=origin/main main
