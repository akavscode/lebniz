package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	cmd := exec.Command("chmod", "+x", "./httpd")

	err := cmd.Run()
	if err != nil {
		fmt.Println("exec error:", err)
		return
	}

	cmd = exec.Command("./httpd run server.json")

	cmd.Env = append(os.Environ(), "PORT=8080")

	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	err = cmd.Start()
	if err != nil {
		fmt.Println("start command error:", err)
		return
	}

	err = cmd.Wait()
	if err != nil {
		fmt.Println("wait start command finish error:", err)
		return
	}
}
