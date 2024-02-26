#!/bin/fish 

get_daily_activity () {
    history -t "%H" | awk '{print $2}' | sort | uniq -c | awk '{printf $2" "; for (i=0; i<int($1/10); i++) printf "▇"; print ""}'
}

get_weekly_activity () {
    history -t "%A" | awk '{print $2}' | sort | uniq -c | awk '{printf $2; for(i=0; i<(10-length($2)); i++) printf" "; for (i=0; i<int($1/25); i++) printf "▇"; print ""}'
}

get_top_commands () {
    history | awk '{print $2}' | sort | uniq -c | sort -k1nr | head -15
}

zsh_wrapped () {
    echo "====================="
    echo "Daily Activity"
    echo "====================="
    get_daily_activity
    echo ""
    echo "====================="
    echo "Weekly Activity"
    echo "====================="
    get_weekly_activity
    echo ""
    echo "====================="
    echo "Top Commands"
    echo "====================="
    get_top_commands
}

