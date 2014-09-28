#!/bin/bash
PATH=/Users/sobranie/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin
export PATH

echo "please input a filename"
read -p "Input a filename : " filename

#判断文件是否存在
test ! -e $filename && echo "You must input a filename" && exit 0

#判断文件类型
test -f $filename && filetype="文件"
test -d $filename && filetype="目录"

#判断文件权限
test -r $filename && perm="可读"
test -w $filename && perm="$perm 可写"
test -x $filename && perm="$perm 可执行"

#输出信息
echo "The file: $filename is a $filetype"
echo "And the permissions are : $perm"
