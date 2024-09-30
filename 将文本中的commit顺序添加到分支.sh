#!/bin/bash

# 检查是否提供了包含commit id的文件名参数
if [ -z "$1" ]; then
  echo "Usage: $0 <commit-ids-file>"
  exit 1
fi

# 获取包含commit id的文件名
COMMIT_IDS_FILE="$1"

# 检查文件是否存在
if [ ! -f "$COMMIT_IDS_FILE" ]; then
  echo "Error: File '$COMMIT_IDS_FILE' does not exist."
  exit 1
fi

# 使用tac命令逆序读取文件中的commit id，并逐个cherry-pick和amend
tac "$COMMIT_IDS_FILE" | while IFS= read -r COMMIT_ID; do
  # Cherry-pick commit
  git cherry-pick "$COMMIT_ID"

  # 检查cherry-pick是否成功
  if [ $? -ne 0 ]; then
    echo "Cherry-pick failed for commit $COMMIT_ID"
    # 处理冲突或失败情况，例如退出脚本
    exit 1
  fi

  # 使用--amend生成Change-Id
  git commit --amend --no-edit

  # 可选：输出信息表示成功
  echo "Successfully cherry-picked and amended commit $COMMIT_ID"
done

# 输出所有操作完成的信息
echo "All commits from '$COMMIT_IDS_FILE' have been cherry-picked and amended to the current branch in reverse order."