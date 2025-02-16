#df -h #show disk usage
#free -h #show memory usage
#top -o %CPU #sort by CPU usage
#top -o %MEM #sort by memory usage
#systemctl list-units --type=service --state=running # shows running services


EMAIL="rajasimha2301@gmail.com"
echo "" > "./report_file.txt"  #empty the file
REPORT_FILE="./report_file.txt"

function send_email(){
    cat $REPORT_FILE | ssmtp $EMAIL
}
function disk_usage(){
    df -h
    echo "disk usage: \n" >> $REPORT_FILE
    df -h >> $REPORT_FILE
}
function cpu_usage(){
    top -o %CPU -n 1
    echo "CPU usage: \n" >> $REPORT_FILE
    top -o %CPU -n 1 >> $REPORT_FILE
}

function memory_usage(){
    free -h
    echo "Memory usage: \n" >> $REPORT_FILE
    free -h  >> $REPORT_FILE
}

function monitor_services(){
    systemctl list-units --type=service --state=running
    echo "Monitor services: \n" >> $REPORT_FILE
    systemctl list-units --type=service --state=running >> $REPORT_FILE
}

inp=1
while [ $inp -gt 0 ]
    do
        read -p "select: 1.disk usage 2.Memory usage 3.CPU usage 4.Monitor services 5.send email 0.exit" inp 
        case $inp in
            1) disk_usage ;;
            2) memory_usage ;;
            3) cpu_usage ;;
            4) monitor_services ;;
            5) send_email ;;
            0) exit ;;
            *) echo "No option selected. Enter 0 if you want to exit" ;;
        esac
    done
