#!/bin/bash

# 检查是否提供了分支名称参数
if [ -z "$1" ]; then
  echo "Usage: $0 <branch-name>"
  exit 1
fi

# 获取分支名称
BRANCH_NAME="$1"

# 设置输出文件名
OUTPUT_FILE="commits_${BRANCH_NAME}.txt"

# 检查分支是否存在
if ! git rev-parse --verify "$BRANCH_NAME" > /dev/null 2>&1; then
  echo "Error: Branch '$BRANCH_NAME' does not exist."
  exit 1
fi

# 获取分支上的所有commit id，并保存到文件中
git rev-list "$BRANCH_NAME" | while read COMMIT_ID; do
  echo "$COMMIT_ID"
done > "$OUTPUT_FILE"

# 输出成功信息
echo "All commit IDs from branch '$BRANCH_NAME' have been saved to '$OUTPUT_FILE'."
