$1 ~ /^[0-9][0-9][0-9][0-9]\/[0-9][0-9]\/[0-9][0-9]$/ {
    date=$1
    count=$2
    month_total=$3
    all_total=$4
    print date, count, month_total, all_total
}
$1 ~ /^[0-9][0-9][0-9][0-9]\/[0-9][0-9]   $/ {
    print "Month Total"
}
