package main

import (
	"fmt"
	"regexp"
	"strings"
	"time"

	"github.com/hpcloud/tail"
)

func main() {
	// Host for master either IP or Domain
	masterHost := "localhost"

	// Port for master
	masterPort := "8888"

	// Combined host & Port for master
	masterURL := "http://" + masterHost + masterPort

	// init time, save the app start time
	initTime := time.Now()

	// Tail -f for /var/log/secure
	t, err := tail.TailFile("/var/log/secure", tail.Config{Follow: true})

	// Throw an error
	if err != nil {
		panic(err)
	}

	// Loop every line in log files
	for line := range t.Lines {

		// Regex, only capture the log time and add years on it
		rTime := regexp.MustCompile("^(.{0,15})")                      // Regex pattern to get first 15 character
		logTimeString := rTime.FindString(line.Text)                   // Execute the rexeg and save it
		logTimeDate, _ := time.Parse(time.Stamp, logTimeString)        // Convert String to Time
		logTimeDateAdd := logTimeDate.AddDate(initTime.Year(), 00, 00) // Add years on Time, because the log doesn't have years

		// Regex for extact IP from string
		rIP := regexp.MustCompile("(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)")

		// Check if the app start Time, so the log before start time will be skipped.
		if logTimeDateAdd.After(initTime) {
			ipLogged := rIP.FindString(line.Text)

			// Check if log Contains Invalid
			if strings.Contains(line.Text, "Invalid") {

				fmt.Println(message("Invalid", ipLogged, logTimeString))
				sendSignal(masterURL)
				// Check if log Contains Accepted
			} else if strings.Contains(line.Text, "Accepted") {

				fmt.Println(message("Accepted", ipLogged, logTimeString))
				sendSignal(masterURL)
			}
		}
	}
}

// Function for combine variable to message
func message(status string, ipLogged string, logTimeString string) string {
	atlantaMessage := logTimeString + " " + status + " login from " + ipLogged

	return atlantaMessage
}

// Function to send post
func sendSignal(masterHost string) {

}
