# GM-Tool Backend _(gm-tool-backend)_

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

Go REST API backend with Echo, Ent ORM, and Swagger documentation for Game Master tools.

GM-Tool Backend provides RESTful endpoints, encounter tracking, combatant calculation, and persistent database storage for game masters running tabletop roleplaying games.

## Table of Contents

- [Background](#background)
- [Install](#install)
- [Usage](#usage)
- [API](#api)
- [Maintainers](#maintainers)
- [Contributing](#contributing)
- [License](#license)

## Background

Virtual tabletops and GM companion screens need an efficient, structured server to handle real-time encounter math, monster stat lookup, and campaign persistence. GM-Tool Backend uses Go with the Echo web framework and Ent ORM to deliver fast, type-safe API operations backed by Swagger/OpenAPI documentation.

## Install

Requires Go 1.24+:

`ash
git clone https://github.com/Nevitash/gm-tool-backend.git
cd gm-tool-backend
go mod download
`

## Usage

Start the backend API server:

`ash
go run cmd/main.go
`

The server starts on port 8080.

Interactive Swagger API documentation is available at:
http://localhost:8080/swagger/index.html

Run tests:

`ash
go test ./...
`

## API

Endpoints provided:

- POST /api/v1/encounters/calculate - Calculate encounter challenge rating and difficulty
- GET /api/v1/combatants - List tracked combatants
- GET /api/v1/items - Search and fetch magic items
- GET /swagger/* - Interactive Swagger UI and OpenAPI specifications

## Maintainers

[@Nevitash](https://github.com/Nevitash)

## Contributing

PRs accepted. Please open an issue first to discuss substantial endpoint additions or database schema updates.

## License

[MIT](LICENSE)
