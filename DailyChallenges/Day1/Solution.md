# System Monitoring and Email Alert Script

## Overview
This script monitors system resource usage and running services, storing the results in a report file. It also provides an option to send the report via email.

## How It Works
**Monitoring Functions**
   - `disk_usage`: Collects disk usage details and appends them to `report_file.txt`.
   - `cpu_usage`: Captures CPU usage statistics and appends them to `report_file.txt`.
   - `memory_usage`: Retrieves memory usage details and appends them to `report_file.txt`.
   - `monitor_services`: Lists all running services and appends them to `report_file.txt`.

**Sending Email**
   - The `send_email` function sends the contents of `report_file.txt` to the configured email using `ssmtp`.

## Usage
Run the script and choose an option:
```bash
./script.sh
```

## Dependencies
Ensure `ssmtp` is installed for email functionality:
```bash
sudo apt install ssmtp
```

# Configure sSMTP to Send Mail

## Installation
```bash
sudo apt install ssmtp
```

## Configuration
Edit the sSMTP configuration file:
```bash
sudo nano /etc/ssmtp/ssmtp.conf
```

## Google Security Settings
1. Enable **2-Step Verification** in Google Security.
2. Go to **App Passwords** and create one for **linux-ssmtp**.
3. Copy the generated password.

## Update `ssmtp.conf` File
```ini
root=rajasimha2301@gmail.com
mailhub=smtp.gmail.com:587
AuthUser=rajasimha2301@gmail.com
AuthPass=linux-ssmtp_content
UseSTARTTLS=YES
```

## Automate with Cron
Edit crontab:
```bash
crontab -e
```
Add this line:
```bash
0 */2 * * * /path/to/script.sh
```

