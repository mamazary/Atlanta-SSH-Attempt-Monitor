# Atlanta
---
Simple SSH Attempt Monitoring using Go and PHP

## Concept
The concept is simple, this is not a monolithic application. This is more like Client-Server apps.

### Client
The client built using Go, the client will listen and tail the log that contain ssh login, in this case on CentOS the log is on `/var/log/secure` and then if there is an `invalid` or `Accepted` message on logs, it will send a POST request to *Master* apps.

### Server
The server built using PHP native, without a framework or whatsoever. it just accepts POST request from Client / Node and then writes it on the database, then show it using Query from MySQL.

## Prerequisite
1. Go installed on your PC
2. PHP
3. Apache / Nginx ( up to you )
4. MySQL

## Installation
You need to build the binary from this repository, because currently the client still beta and the config need to write directly to the source code.

1. Clone this repository `git clone https://gitlab.com/mamazary/atlanta-ssh-attempt-monitor.git `
2. Create database on MySQL and assign user to it.
3. Import the sql into your MySQL database.
3. Change directory `cd atlanta-ssh-attempt-monitor`
4. Copy the files on master folder to your accessible webroot, ex: `/var/www/htlml`
5. Change the database configuration in the `database.php` file
   ```
   $dbHost = '127.0.0.1';       // Database Host
   $dbName = 'atlanta';         // Database Name
   $dbUser = 'atlanta';         // Database Username
   $dbPass = 'v3PZ2F6r9enJXzz'; // Database Password
   $dbPort = '3306';            // Database port
   ```
6. Make sure the website is running by visiting your ip or host.
7. You can `truncate` the database content, for start fresh.
3. Get tail package for Go on github `go get github.com/hpcloud/tail`
4. Change the parameter on client based on your environment.
    ```
	// Host for master either IP or Domain
	masterHost := "atlanta.local"

	// Port for master
	masterPort := "8888"

	// Node name
	nodeName := "nodeABC"

	// Log file path
	logFilePath := "/var/log/secure"
    ```
5. Run build command 'go build'
6. Run the executeable files `./atlanta`
7. So, every SSH attempt that happened on Client will reported to the Master.

## Known Bug
1. The client is not running on background, so use another Terminal or use the `screen` app to run it on background. Next release will be fixed using a daemon function.
2. The client need to recompile on every node, you can compile using one computer and then copy the executable files to a desired node. Next release will be fixed using daemon function with setup command, so no need to change the config on source code or recompile the executable file.
3. The Master did not have any authentication. You can used `htpasswd` for temporary solution. But Next release will have a login function.

## Road Map
- Add daemon function to the client
- Add OS detection, to automatically detect logs location for SSH
- Add Authentication on Master dashboard
- Add styling on Master dashboard so its pleasing on eye
- Auto Deployment support
- Container support

## Contribution
Because this is an opensource project, you are freely to add feature or function, I will be very grateful. I know this app is far from perfect, so I need your help to make this app awesome.

## License
This work is under [MIT](LICENSE) license.
