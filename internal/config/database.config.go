package config

import (
	"fmt"
	"os"
	"strconv"
)

type DatabaseConfig struct {
	host         string
	port         int
	user         string
	password     string
	databaseName string
}

func (config *DatabaseConfig) GetHost() string {
	if config.host != "" {
		return config.host
	}

	config.host = os.Getenv("DB_HOST")
	return config.host
}

func (config *DatabaseConfig) GetPort() int {
	if config.port != 0 {
		return config.port
	}

	portStr := os.Getenv("DB_PORT")
	if portStr == "" {
		return 0
	}

	port, err := strconv.Atoi(portStr)
	if err != nil {
		fmt.Printf("Warning: Could not convert DB_PORT '%s' to int: %v\n", portStr, err)
		return 0
	}

	config.port = port
	return config.port
}

func (config *DatabaseConfig) GetUser() string {
	if config.user != "" {
		return config.user
	}

	config.user = os.Getenv("DB_USER")
	return config.user
}

func (config *DatabaseConfig) GetPassword() string {
	if config.password != "" {
		return config.password
	}

	config.password = os.Getenv("DB_PASSWORD")
	return config.password
}

func (config *DatabaseConfig) GetDatabaseName() string {
	if config.databaseName != "" {
		return config.databaseName
	}

	config.databaseName = os.Getenv("DB_NAME")
	return config.databaseName
}

func NewDatabaseConfig() *DatabaseConfig {
	return &DatabaseConfig{}
}
