
function check_total_col(lineno, title, expect, actual)
{
    if ( actual > 0 && expect != actual ) {
        print_mismatch_line(NR, title, expect, actual);
        ++ num_errors;
        return  1;
    }
    return  0;
}

function print_mismatch_line(lineno, title, expect, actual)
{
    printf("Mismatch (Line %6d) :%18s :\tExpect = %8d\tActual = %8d\t%s\n",
           lineno, title, expect, actual, $1);
    return;
}

$1 ~ /^[0-9]{4}\/[0-9]{2}   $/ {
    rec_date        = $1
    rec_month_total = $4
    rec_all_total   = $5
    rec_range_total = $6

    chk_all_total   += rec_month_total
    chk_range_total += rec_month_total

    check_total_col(NR, "#     All Total", chk_all_total, rec_all_total);
    check_total_col(NR, "#   Range Total", chk_range_total, rec_range_total);

    if ( rec_range_total ~ /\*{4,12}$/ ) {
        chk_range_total = 0
    }
}

END {
    printf("# of error data    = %d\n", num_errors);
}
