$1 ~ /^[0-9][0-9][0-9][0-9]\/[0-9][0-9]\/[0-9][0-9]$/ {
    date=$1
    weekday=$2
    count=$3
    month_total=$4
    all_total=$5
    chk_month_total += count
    chk_all_total   += count
    chk_range_total += count

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

    if ( rec_month_total > 0 && chk_month_total != rec_month_total ) {
        print "Mismatch Monthly Total ", chk_month_total, rec_month_total, NR
    }
    if ( rec_all_total > 0 && chk_all_total != rec_all_total ) {
        print "Mismatch Total ", chk_all_total, rec_all_total, NR
    }
    if ( rec_range_total == "********" ) {
        chk_range_total = 0
    }
    chk_month_total = 0
}
