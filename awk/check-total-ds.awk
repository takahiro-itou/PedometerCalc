
function print_mismatch_line(lineno, title, expect, actual) {
    printf("at %d:\tMismatch %s\t%d\t%d\n", lineno, title, expect, actual);
}

$1 ~ /^[0-9][0-9][0-9][0-9]\/[0-9][0-9]\/[0-9][0-9]$/ {
    date    = $1
    weekday = $2
    count   = $3
    rec_month_total = $4
    rec_all_total   = $5
    chk_month_total += count
    chk_all_total   += count
    chk_range_total += count

    if ( rec_month_total > 0 && chk_month_total != rec_month_total ) {
        print_mismatch_line(NR, "Monthly Total",
                            chk_month_total, rec_month_total);
    }
    if ( rec_all_total > 0 && chk_all_total != rec_all_total ) {
        print_mismatch_line(NR, "Total", chk_all_total, rec_month_total);
    }
}

$1 ~ /^[0-9][0-9][0-9][0-9]\/[0-9][0-9]   $/ {
    rec_month_total = $4
    rec_all_total   = $5
    rec_range_total = $6

    if ( rec_month_total > 0 && chk_month_total != rec_month_total ) {
        print_mismatch_line(NR, "Monthly Total",
                            chk_month_total, rec_month_total);
    }
    if ( rec_all_total > 0 && chk_all_total != rec_all_total ) {
        print_mismatch_line(NR, "Total ", chk_all_total, rec_all_total);
    }
    if ( rec_range_total == "********" ) {
        chk_range_total = 0
    }
    chk_month_total = 0
}
