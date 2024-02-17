$1 ~ /^[0-9][0-9][0-9][0-9]\/[0-9][0-9]\/[0-9][0-9]$/ {
    date=$1
    weekday=$2
    count=$3
    month_total=$4
    all_total=$5
    print date, count, month_total, all_total
    chk_month_total += count
    chk_all_total += count
    if ( month_total > 0 && chk_month_total != month_total ) {
        print "Mismatch Monthly Total ", month_total, chk_month_total, NR
    }
    if ( all_total > 0 && chk_all_total != all_total ) {
        print "Mismatch Total ", all_total, chk_month_total, NR
    }
}
$1 ~ /^[0-9][0-9][0-9][0-9]\/[0-9][0-9]   $/ {
    rec_month_total=$4
    rec_all_total=$5
    rec_range_total=$6
    print "Month Total", rec_month_total, rec_all_total, rec_lim_total

    if ( rec_month_total > 0 && chk_month_total != rec_month_total ) {
        print "Mismatch Monthly Total ", chk_month_total, rec_month_total, NR
    }
    if ( rec_all_total > 0 && chk_all_total != rec_all_total ) {
        print "Mismatch Total ", chk_all_total, rec_all_total, NR
    }
}
