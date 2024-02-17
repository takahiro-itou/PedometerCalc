$1 ~ /^[0-9][0-9][0-9][0-9]\/[0-9][0-9]\/[0-9][0-9]$/ {
    date=$1
    weekday=$2
    count=$3
    month_total=$4
    all_total=$5
    print date, count, month_total, all_total
}
$1 ~ /^[0-9][0-9][0-9][0-9]\/[0-9][0-9]   $/ {
    rec_month_total=$4
    rec_all_total=$5
    rec_range_total=$6
    print "Month Total", rec_month_total, rec_all_total, rec_lim_total
}
