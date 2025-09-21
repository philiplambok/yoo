# Yoo - Rails Development Environment

A Rails 8.0.2.1 application with Docker-based development environment for easy setup and consistent development experience.

## 🚀 Quick Start

```bash
# Build and start the development environment
./dx/build
./dx/start

# Start Rails server (in a new terminal)
./dx/dev
# Visit http://localhost:3000

# Or use the rebuild command for a fresh start
./dx/rebuild
```

## 📋 Available Commands

All development commands are located in the `dx/` directory for easy access. Run `./dx/help` for a complete overview.

### Container Management

| Command | Description | Usage |
|---------|-------------|-------|
| `./dx/build` | Build Docker development images | Run after Dockerfile changes |
| `./dx/start` | Start container in detached mode | Start development environment |
| `./dx/stop` | Stop and remove containers | Clean shutdown |
| `./dx/rebuild` | Full environment rebuild | Stop → Build → Start in one command |
| `./dx/status` | Show container status | Check if containers are running |
| `./dx/logs` | View container logs | Use `-f` flag to follow logs |

### Rails Development

| Command | Description | Usage |
|---------|-------------|-------|
| `./dx/dev` | Start Rails server | Access at http://localhost:3000 |
| `./dx/console` | Start Rails console | Interactive Ruby/Rails console |

### Testing & Quality

| Command | Description | Usage |
|---------|-------------|-------|
| `./dx/setup` | Setup dev & test databases | Sets up both environments |
| `./dx/test` | Run test suite | `./dx/test` or `./dx/test <specific_test>` |
| `./dx/lint` | Run RuboCop linter | Check code style and quality |
| `./dx/seed` | Seed database with sample data | Populate with test data |
| `./dx/reset-db` | Reset database completely | Drop → Create → Migrate → Seed |
| `./dx/db-reset` | Alias for reset-db | Rails `db:reset` equivalent |

### Utilities

| Command | Description | Usage |
|---------|-------------|-------|
| `./dx/exec` | Execute commands in container | `./dx/exec bash` or `./dx/exec <command>` |
| `./dx/help` | Show all available commands | Complete command reference |

## 🛠️ Development Workflow

### First Time Setup
```bash
./dx/build     # Build Docker images
./dx/start     # Start container
./dx/setup     # Setup development & test databases

# Or use the one-command approach
./dx/rebuild   # Stop, build, and start fresh
./dx/setup     # Setup databases
```

### Daily Development
```bash
# Check environment status
./dx/status

# Terminal 1 - Rails server
./dx/dev

# Terminal 2 - Rails console & commands
./dx/console
./dx/exec rails generate model User
./dx/exec rails db:migrate

# Terminal 3 - Testing & Quality
./dx/test
./dx/test test/models/user_test.rb
./dx/lint

# View logs when debugging
./dx/logs -f    # Follow logs in real-time
```

### Shutdown
```bash
./dx/stop      # Stop everything
```

## 🔧 Technical Details

* **Ruby Version**: 3.2.9 (managed via [mise](https://mise.jdx.dev/))
* **Rails Version**: 8.0.2.1
* **Database**: SQLite (development & test)
* **Node.js**: 22.x (for asset pipeline)
* **Package Manager**: Yarn
* **Container OS**: Debian 12 (Bookworm)

## 📂 Project Structure

```
├── dx/                 # Development scripts
│   ├── build          # Build Docker images
│   ├── start          # Start containers
│   ├── stop           # Stop containers
│   ├── rebuild        # Full environment rebuild
│   ├── status         # Show container status
│   ├── logs           # View container logs
│   ├── dev            # Start Rails server
│   ├── console        # Rails console
│   ├── setup          # Setup databases (dev & test)
│   ├── test           # Run test suite
│   ├── lint           # Run RuboCop linter
│   ├── seed           # Seed database with sample data
│   ├── reset-db       # Reset database completely
│   ├── db-reset       # Alias for reset-db
│   ├── exec           # Execute container commands
│   ├── help           # Show all commands
│   └── _common        # Shared functions & error handling
├── Dockerfile.dev     # Development container definition
├── docker-compose.dev.yml # Development services
└── mise.toml          # Ruby version specification
```

## 🐳 Docker Configuration

The development environment uses:
- **Volume mounting** for live code editing
- **Port 3000** mapped to localhost:3000  
- **SQLite database** persisted in `storage/` directory
- **mise** for Ruby version management
- **Sleep infinity** container for flexibility

## 🧪 Testing

```bash
# Setup databases (first time only)
./dx/setup      # Sets up both development and test databases

# Run all tests
./dx/test

# Run specific test file
./dx/test test/models/user_test.rb

# Run specific test method
./dx/test test/models/user_test.rb -n test_should_be_valid
```

## 🤝 Contributing

1. Ensure Docker is installed on your system
2. Clone the repository
3. Follow the Quick Start guide above
4. Make your changes with live reload
5. Run tests and linting before committing: `./dx/test && ./dx/lint`

## 💡 Tips

- **Get help anytime**: Run `./dx/help` for a complete command overview
- **Check status**: Use `./dx/status` to see if containers are running
- **Debug issues**: Use `./dx/logs` or `./dx/logs -f` to view container output
- **Fresh start**: Run `./dx/rebuild` for a complete environment rebuild
- **Database reset**: Use `./dx/reset-db` to completely reset your database with fresh sample data
- **Error handling**: All commands check for Docker availability automatically
- **Database persistence**: Database files are automatically persisted between restarts
- **Flexibility**: Use `./dx/exec` for any Rails commands not covered by specific scripts

## 🔍 Troubleshooting

### Common Issues

```bash
# Container not responding?
./dx/rebuild

# Want to see what's happening?
./dx/logs -f

# Check if everything is running
./dx/status

# Docker issues?
# All commands will check Docker availability and provide helpful error messages
```
