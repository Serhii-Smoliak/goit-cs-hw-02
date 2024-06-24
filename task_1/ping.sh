#!/bin/bash

websites=("https://google.com" "https://facebook.com" "https://twitter.com")

logfile="website_status.log"

> $logfile

for website in "${websites[@]}"; do
  status_code=$(curl -L -s -o /dev/null -w "%{http_code}" $website)

  if [ $status_code -eq 200 ]; then
    echo "[<$website>] is UP"
    echo "[<$website>] is UP" >> $logfile
  else
    echo "[<$website>] is DOWN"
    echo "[<$website>] is DOWN" >> $logfile
  fi
done

echo "The results have been saved in $logfile"