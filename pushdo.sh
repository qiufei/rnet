#!/bin/sh


cd ~/rnet

git pull

git add --all 

git commit -a -m " add ppt"

git push

# finally
echo "rnet数据已经更新到github！" 