#!/bin/bash


log_file="user_activity.log"

#echo "task1: getting unique ip's"
awk '
    for (i=1; i<=NF; i++) {
        if ($i ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/){
            split($i, octets, ".")
            if (octets[1]<=255 && octets[2]<=255 && octets[3]<=255 && octets[4]<=255) {
                print $i
            }
        }
        else if ($i ~ /^[0-9a-fA-F:]+$/){
            if (gsub(/:/,":",$i) >2 )
            {print $1}
        }
    }
' "$log_file" | sort -u > "unique_ips.txt"
echo "unique ips saved to unique_ips.txt"

#echo "task2: extracting users"
awk '
    for (i=1; i<=NF; i++) {
        if ($i ~ /^user[0-9]+$/){
            print $1
        }
    }
' "$log_file" | sort -u > "users_file.txt"

#echo "task3: extracting status codes and their count"
awk ' {

    if ($(NF) ~ /^[0-9]+$/)
    {
        status[$(NF)]++
    }
}  END {
    for (code in status)
    { print code, status[code] }
} ' "$log_file" | sort -n > "status_codes.txt"

#echo "task4: Extracting Failed Login Attempts..."
awk '
    if ($(NF) == "403"){
        for (i=1; i<=NF ; i++){
            if ($i ~ /\[.*\]/)
            { 
                timestamp= $i
                break
            }
        }
        print timestamp, $0
    }
' "$log_file" > "login_failed_attempts.txt"

#echo "task5"
awk '
    BEGIN{
        successful_req = 0
        failed_req = 0
    }
    for (i=1; i<=NF; i++)
    {
        # in users[] array, length(users) gives the no of users, users[user1] gives no of req by user1
        if ($i ~ /^user[0-9]+$/)
        { users[$i]++  }

        if ($(NF) == "403" || $(NF) == "404" )
        { failed_req++ }
        else
        { sucess_req++ }
    }
    END{
        print "Summary Report"
        print "no of users = ", length(users)
        for (user in users){
            print "no of requests by ",user, " = ", users(user)
        }
        print "no of failed requests = ", failed_req
        print "no of successful requests = ", successful_req
    }
' "$log_file" > "summary_report.txt"
echo "summary saved to summary_report.txt"
