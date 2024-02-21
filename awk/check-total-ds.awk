
function check_total_col(lineno, title, expect, actual)
{
    if ( expect > 0 && actual > 0 && expect != actual ) {
        print_mismatch_line(NR, title, expect, actual);
    }
    return;
}

function print_mismatch_line(lineno, title, expect, actual)
{
    printf("Mismatch (Line %6d) :%18s :\tExpect = %8d\tActual = %8d\n",
           lineno, title, expect, actual);
    return;
}

$1 ~ /^[0-9]{4}\/[0-9]{2}\/[0-9]{2}$/ {
    date    = $1
    weekday = $2
    count   = $3
    rec_month_total = $4
    rec_all_total   = $5
    chk_month_total += count
    chk_all_total   += count
    chk_range_total += count

    check_total_col(NR, "@ Monthly Total", chk_month_total, rec_month_total);
    check_total_col(NR, "@     All Total", chk_all_total, rec_all_total);
}

$1 ~ /^[0-9]{4}\/[0-9]{2}   $/ {
    rec_month_total = $4
    rec_all_total   = $5
    rec_range_total = $6

    check_total_col(NR, "# Monthly Total", chk_month_total, rec_month_total);
    check_total_col(NR, "#     All Total", chk_all_total, rec_all_total);
    check_total_col(NR, "#   Range Total", chk_range_total, rec_range_total);

    if ( rec_range_total == "********" ) {
        chk_range_total = 0
    }
    chk_month_total = 0
}
