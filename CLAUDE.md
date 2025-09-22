# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

This project uses a comprehensive set of `dx/` commands for Docker-based Rails development:

### Essential Commands
- `./dx/build` - Build Docker development images
- `./dx/start` - Start containers in detached mode  
- `./dx/setup` - Setup development and test databases
- `./dx/dev` - Start Rails server + Sidekiq worker with Foreman
- `./dx/test` - Run Rails test suite (`./dx/test <file>` for specific tests)
- `./dx/lint` - Run RuboCop linter (`./dx/lint --fix` for auto-correction)
- `./dx/console` - Rails console access

### Container Management
- `./dx/rebuild` - Full environment rebuild (stop → build → start)
- `./dx/stop` - Stop and remove all containers
- `./dx/status` - Show container status
- `./dx/logs` - View container logs (`./dx/logs -f` to follow)

### Database Operations
- `./dx/seed` - Seed database with sample data
- `./dx/reset-db` - Complete database reset (drop → create → migrate → seed)
- `./dx/exec <command>` - Execute any command in container

**First-time setup**: `./dx/build && ./dx/start && ./dx/setup`

**Daily workflow**: `./dx/dev` (starts both Rails server and Sidekiq worker)

## Architecture

### Technology Stack
- **Rails 8.0.2.1** with PostgreSQL 16 database
- **Docker-based development** with `docker-compose.dev.yml`
- **Background jobs** via Sidekiq 7.x with Redis
- **Process management** via Foreman (Procfile defines web + worker processes)
- **Version management** via mise (Ruby 3.2.x, Node.js 22.x)

### Key Services
- **Rails app**: http://localhost:3000
- **Sidekiq Web UI**: http://localhost:3000/sidekiq  
- **PostgreSQL**: localhost:5433 (user: `yoo`, password: `password`, db: `yoo_development`)
- **Redis**: Internal Docker networking only

### Application Structure
```
app/
├── controllers/        # Standard Rails controllers (users, posts, messages)
├── models/            # ActiveRecord models with basic validations
├── jobs/              # Background jobs (CreateRandomUsersJob sample)
├── helpers/           # View helpers
└── views/             # ERB templates

dx/                    # Developer experience commands
├── _common           # Shared Docker validation functions
├── build, start, stop # Container lifecycle
├── dev, console      # Rails development
├── test, lint        # Quality assurance  
└── setup, seed       # Database operations
```

### Development Patterns
- **Dockerized environment** eliminates local dependencies
- **Sample data seeding** provides realistic development data
- **Background job processing** with Sidekiq for async tasks
- **Rails Omakase styling** with RuboCop for consistent code quality
- **Modern browser support** with Rails 8 defaults

## Code Quality

- **Linting**: Uses `rubocop-rails-omakase` configuration
- **Testing**: Rails minitest framework
- **Auto-fix**: `./dx/lint --fix` for automatic style corrections

## Database Access

External database connections available at:
- Host: `localhost:5433`
- Database: `yoo_development` (or `yoo_test`)
- User: `yoo` / Password: `password`

## Background Jobs

The application includes a complete Sidekiq setup:
- Jobs are queued via `perform_later` 
- Sidekiq worker runs alongside Rails server via Foreman
- Sample job `CreateRandomUsersJob` demonstrates background processing
- Monitor jobs via Sidekiq Web UI at `/sidekiq`