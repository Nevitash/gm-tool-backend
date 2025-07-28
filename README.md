# Go REST API Backend

This project is a simple REST API backend built with Go, designed to be used with a React application. It provides endpoints for managing resources, specifically items.

## Project Structure

```
go-rest-api-backend
├── cmd
│   └── main.go          # Entry point of the application
├── internal
│   ├── handlers
│   │   └── handler.go   # HTTP request handlers
│   ├── models
│   │   └── model.go     # Data structures
│   └── routes
│       └── routes.go    # API routes setup
├── go.mod                # Module definition
├── go.sum                # Dependency checksums
└── README.md             # Project documentation
```

## Getting Started

### Prerequisites

- Go 1.16 or later
- A working Go environment

### Installation

1. Clone the repository:

   ```
   git clone <repository-url>
   cd go-rest-api-backend
   ```

2. Install the dependencies:

   ```
   go mod tidy
   ```

### Running the API

To run the API, execute the following command:

```
go run cmd/main.go
```

The server will start on `localhost:8080` by default.

### API Endpoints

- `GET /items` - Retrieve a list of items
- `POST /items` - Create a new item

### License

This project is licensed under the MIT License.