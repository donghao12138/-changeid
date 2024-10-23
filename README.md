批量生成changeid
# -changeid
遇到一个问题,就是添加changeid只能够通过命令进行最近几个的修改,不能够保持目录结构的同时添加所有changeid,所以写了两个脚本,这两个脚本的目的是1,拉取所有的commit信息2,将这些commit信息添加到某一分支,并且添加changeid

1,生成目标分支的所有commit信息
2,将这些commit合并到本分支,并进行git commit --amend 添加changeid

使用时如何第一个提交就出现错误
使用tac命令查看文件的换行是否正确
