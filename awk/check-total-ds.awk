$1 ~ /^[0-9][0-9][0-9][0-9]\/[0-9][0-9]\/[0-9][0-9]$/ {
    date=$1
    weekday=$2
    count=$3
    month_total=$4
    all_total=$5
    print date, count, month_total, all_total
}
$1 ~ /^[0-9][0-9][0-9][0-9]\/[0-9][0-9]   $/ {
    print "Month Total"
}
