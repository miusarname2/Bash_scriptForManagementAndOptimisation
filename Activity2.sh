#!/bin/bash

echo "Write the current month(On English):"

read current_month

if [ "$current_month" = "January" ]; then
    monthCurrent="Jan"
elif [ "$current_month" = "February" ]; then
    monthCurrent="Feb"
elif [ "$current_month" = "March" ]; then
    monthCurrent="Mar"
elif [ "$current_month" = "April" ]; then
    monthCurrent="Apr"
elif [ "$current_month" = "May" ]; then
    monthCurrent="May"
elif [ "$current_month" = "June" ]; then
    monthCurrent="Jun"
elif [ "$current_month" = "July" ]; then
    monthCurrent="Jul"
elif [ "$current_month" = "August" ]; then
    monthCurrent="Aug"
elif [ "$current_month" = "September" ]; then
    monthCurrent="Sep"
elif [ "$current_month" = "October" ]; then
    monthCurrent="Oct"
elif [ "$current_month" = "November" ]; then
    monthCurrent="Nov"
elif [ "$current_month" = "December" ]; then
    monthCurrent="Dec"
else
    echo "Invalid month entered. Please enter a valid month."
    exit 1
fi

fileDates=$(ls -l | awk -v month="$monthCurrent" '$6 ~ month {print $6, $7, $8}')

IFS=$'\n' read -r -a dates <<< "$fileDates"

current_date=$(date +%s)

for date in "${dates[@]}"; do
    date_in_seconds=$(date -d "$date" +%s)
    
    diff=$(( (current_date - date_in_seconds) / 86400 ))

    if (( diff > 7 )); then
        dates_older_than_7_days+=("$date")
    fi
done

echo "Files older than 7 days:"
for date in "${dates_older_than_7_days[@]}"; do
    echo "$date"
done
