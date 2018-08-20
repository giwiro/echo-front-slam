package main

import (
    "os"
    "fmt"
    "github.com/labstack/echo"
)

func controller(c echo.Context) error {
    return c.File("public/index.html")
}

func main() {
    server := echo.New()
    port := os.Getenv("PORT")
    if (len(port) == 0) {
        port = "6543"
    }
    server.Static("/static","public/assets")
    server.GET("/*", controller)

    server.Logger.Fatal(server.Start(fmt.Sprintf(":%s", port)))
}

