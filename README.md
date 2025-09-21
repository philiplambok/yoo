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
```

## 📋 Available Commands

All development commands are located in the `dx/` directory for easy access:

### Core Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `./dx/build` | Build Docker development images | Run after Dockerfile changes |
| `./dx/start` | Start container in detached mode | Start development environment |
| `./dx/stop` | Stop and remove containers | Clean shutdown |

### Development Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `./dx/dev` | Start Rails server | Access at http://localhost:3000 |
| `./dx/console` | Start Rails console | Interactive Ruby/Rails console |
| `./dx/exec` | Execute commands in container | `./dx/exec bash` or `./dx/exec <command>` |

### Testing Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `./dx/prepare` | Prepare test database | Run before first test or after schema changes |
| `./dx/test` | Run test suite | `./dx/test` or `./dx/test <specific_test>` |

## 🛠️ Development Workflow

### First Time Setup
```bash
./dx/build     # Build Docker images
./dx/start     # Start container
./dx/prepare   # Setup test database
```

### Daily Development
```bash
# Terminal 1 - Rails server
./dx/dev

# Terminal 2 - Rails console & commands
./dx/console
./dx/exec rails generate model User
./dx/exec rails db:migrate

# Terminal 3 - Testing
./dx/test
./dx/test test/models/user_test.rb
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
│   ├── dev            # Start Rails server
│   ├── console        # Rails console
│   ├── prepare        # Setup test database
│   ├── test           # Run test suite
│   ├── exec           # Execute container commands
│   └── stop           # Stop containers
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
# Setup test database (first time only)
./dx/prepare

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
5. Run tests before committing: `./dx/test`

## 💡 Tips

- All `dx/` scripts include helpful output and instructions
- Use `./dx/exec` for any Rails commands not covered by specific scripts
- The container stays running with `sleep infinity` for maximum flexibility
- Database files are automatically persisted between container restarts
