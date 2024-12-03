#!/bin/bash

# 設定 bucket 路徑
BUCKET="gs://mrl-backup/nifi"

# 獲取當前時間戳
CURRENT_DATE=$(date +%s)
echo "Current Date: ${CURRENT_DATE}"
# 列出所有目錄
gsutil ls -r ${BUCKET} | grep "mrl_sales_delivery_" | while read -r dir; do
  #echo "Processing directory: ${dir}"

  # 提取時間戳，例如 20241128203500
  TIMESTAMP=$(echo "${dir}" | grep -oP '\d{14}')
  if ! echo "${dir}" | grep -q "${TIMESTAMP}/:$"; then
    continue
  fi

  # 檢查是否成功提取時間戳
  if [ -n "${TIMESTAMP}" ]; then
    # 將時間戳轉換為秒數
    DATE_PART=$(echo ${TIMESTAMP} | cut -c 1-8);
    HOUR_PART=$(echo ${TIMESTAMP} | cut -c 9-10);
    MIN_PART=$(echo ${TIMESTAMP} | cut -c 11-12);
    SEC_PART=$(echo ${TIMESTAMP} | cut -c 13-14);
    DIR_DATE=$(date -d "${DATE_PART} ${HOUR_PART}:${MIN_PART}:${SEC_PART}" +%s 2>/dev/null)
    #DIR_DATE=$(date -d "${DATE_PART} ${HOUR_PART}:${MIN_PART}:${SEC_PART}" +%s);
    # 檢查時間轉換是否成功
    if [ $? -ne 0 ]; then
      echo "Error converting timestamp: ${TIMESTAMP}" >&2
      continue
    fi

    # 計算時間差
    AGE=$(( (CURRENT_DATE - DIR_DATE) / 86400 ))
    echo "${dir} Directory Age: ${AGE} days"

    # 如果超過 3 天，刪除目錄
    if [ "${AGE}" -gt 3 ]; then
      echo "Deleting directory: ${dir%/:}"
      # 真正執行刪除指令
      gsutil -m rm -r "${dir%/:}"
    fi
  else
    echo "No valid timestamp found for: ${dir}" >&2
  fi
done
