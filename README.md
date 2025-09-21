# Yoo - Developer Experience (DX) Command Prototyping

A sample Rails 8.0.2.1 application designed for prototyping and demonstrating **Developer Experience (DX)** commands. This project showcases a comprehensive set of `dx/` commands that streamline Rails development workflows with Docker.

## 🎯 About DX Commands

The `dx/` directory contains a collection of developer experience commands that simplify common development tasks:
- **Container Management** - Build, start, stop, and rebuild environments
- **Database Operations** - Setup, seeding, and complete database resets  
- **Development Tools** - Rails server, console, testing, and linting
- **Utilities** - Logging, status checking, and command execution

These commands demonstrate best practices for creating intuitive, consistent developer workflows that reduce cognitive load and improve productivity.

### DX Command Design Principles:
- **🎯 Single Purpose** - Each command does one thing well
- **📝 Clear Naming** - Intuitive, verb-based command names
- **🔄 Consistent Interface** - Standardized output, error handling, and help
- **⚡ Developer Friendly** - Helpful messages, progress indicators, and confirmations
- **🛡️ Safe by Default** - Confirmation prompts for destructive operations
- **🔍 Discoverable** - Comprehensive help and documentation

## 🚀 Quick Start

```bash
# Build and start the development environment
./dx/build
./dx/start

# Setup databases (PostgreSQL)
./dx/setup

# Start Rails server (in a new terminal)
./dx/dev
# Visit http://localhost:3000

# Or use the rebuild command for a fresh start
./dx/rebuild
./dx/setup  # Run setup after rebuild
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
* **Database**: PostgreSQL 16 (development & test)
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
- **PostgreSQL database** with persistent volume storage
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

## 🌐 Testable URLs

After running `./dx/seed`, you can test these URLs to see the sample data in action:

### Main Resources
- **📄 Root Page**: [http://localhost:3000](http://localhost:3000) - Messages index (homepage)
- **👥 Users**: [http://localhost:3000/users](http://localhost:3000/users) - List all sample users
- **📝 Posts**: [http://localhost:3000/posts](http://localhost:3000/posts) - Development-focused blog posts
- **💬 Messages**: [http://localhost:3000/messages](http://localhost:3000/messages) - Welcome messages and community guidelines

### Individual Records (Examples)
- **📄 First Post**: [http://localhost:3000/posts/1](http://localhost:3000/posts/1) - "Welcome to our Rails Application"
- **👤 Admin User**: [http://localhost:3000/users/1](http://localhost:3000/users/1) - admin@example.com
- **💬 Welcome Message**: [http://localhost:3000/messages/1](http://localhost:3000/messages/1) - Platform welcome message

### System Health
- **🏥 Health Check**: [http://localhost:3000/up](http://localhost:3000/up) - Rails application health status

### Quick Demo Flow:
```bash
./dx/seed          # Populate with sample data
./dx/dev           # Start Rails server
# Visit http://localhost:3000 to explore!
```

## 🗄️ Database Access

### Connecting to PostgreSQL with Database Clients

You can connect to the PostgreSQL database using any PostgreSQL client for debugging and data inspection:

#### **Connection Settings**
- **Host**: `localhost`
- **Port**: `5432`
- **Database**: `yoo_development` (or `yoo_test` for test database)
- **Username**: `yoo`
- **Password**: `password`

#### **Popular Database Clients**

**TablePlus** (macOS/Windows)
1. Create new connection → PostgreSQL
2. Enter connection settings above
3. Test connection and save

**pgAdmin** (Cross-platform)
1. Add New Server
2. Connection tab: Enter host, port, database, username, password
3. Save and connect

**DBeaver** (Free, Cross-platform)
1. New Database Connection → PostgreSQL
2. Enter connection details
3. Test Connection → Finish

**psql** (Command line - requires local PostgreSQL client)
```bash
# Only works if you have PostgreSQL client installed locally:
psql -h localhost -p 5432 -U yoo -d yoo_development

# Or using connection URL
psql postgresql://yoo:password@localhost:5432/yoo_development

# If you don't have psql installed locally, use this instead:
./dx/exec psql -h db -U yoo -d yoo_development
```

#### **VS Code Extensions**
- **PostgreSQL** by Chris Kolkman
- **Database Client** by Weijan Chen

Connection URL format:
```
postgresql://yoo:password@localhost:5432/yoo_development
```

#### **Quick Database Commands**

**Using dx commands (recommended - always works):**
```bash
# Connect to interactive psql session
./dx/exec psql -h db -U yoo -d yoo_development

# Quick queries via dx commands
./dx/exec psql -h db -U yoo -d yoo_development -c "\l"                    # List databases
./dx/exec psql -h db -U yoo -d yoo_development -c "\dt"                   # List tables
./dx/exec psql -h db -U yoo -d yoo_development -c "SELECT * FROM users LIMIT 5;"  # Sample data
```

**Using local psql (only if PostgreSQL client is installed locally):**
```bash
# Install PostgreSQL client first (macOS example):
brew install postgresql

# Then connect directly
psql -h localhost -p 5432 -U yoo -d yoo_development
```

**Note**: The database is only accessible when containers are running (`./dx/start`).

#### **Troubleshooting Database Connections**

**Connection Refused Error**
```bash
# Check if containers are running
./dx/status

# Start containers if needed
./dx/start

# Check database health
./dx/logs db
```

**Authentication Failed**
- Verify username: `yoo`
- Verify password: `password`
- Verify database name: `yoo_development`

**Port Already in Use**
If port 5432 is already in use by a local PostgreSQL instance:
```bash
# Check what's using port 5432
lsof -i :5432

# Stop local PostgreSQL if needed (macOS with Homebrew)
brew services stop postgresql
```

**Database Not Found**
```bash
# Create databases if they don't exist
./dx/setup
```

## 🤝 Contributing

This project serves as a reference implementation for DX commands. Contributions are welcome for:

1. **New DX commands** - Add useful developer workflow automation
2. **Command improvements** - Better error handling, messaging, or functionality  
3. **Documentation** - Clear examples and best practices
4. **Rails app features** - Sample functionality to demonstrate DX commands

### Getting Started:
1. Ensure Docker is installed on your system
2. Clone the repository
3. Follow the Quick Start guide above
4. Make your changes with live reload
5. Run tests and linting before committing: `./dx/test && ./dx/lint`

### Adding New DX Commands

When creating new dx commands, follow these patterns:

#### **1. Command Structure Template**
```bash
#!/bin/bash
# Brief description of what this command does

# Source common functions
source "$(dirname "$0")/_common"
check_docker

echo "🎯 Starting [operation]..."
echo "💡 Helpful tip or context"
echo ""

# Main command execution
docker-compose -f docker-compose.dev.yml exec app [your-command]

echo ""
echo "✅ [Operation] complete!"
```

#### **2. Naming Conventions**
- **Single words** when possible (`build`, `test`, `lint`)
- **Hyphenated for compound actions** (`reset-db`, `db-reset`)
- **Verb-based** for actions (`start`, `stop`, `rebuild`)
- **Noun-based** for information (`status`, `logs`, `help`)

#### **3. Required Elements**
- **Executable permissions**: `chmod +x dx/your-command`
- **Common functions**: Always source and call `check_docker`
- **Helpful output**: Use emojis and clear messaging
- **Error handling**: Provide actionable error messages
- **Documentation**: Update `dx/help` and README.md

#### **4. Testing New Commands**
```bash
# Test your command
./dx/your-command

# Verify help integration
./dx/help

# Test error handling
# (stop containers and test error messages)
```

## 💡 Tips

- **Get help anytime**: Run `./dx/help` for a complete command overview
- **Check status**: Use `./dx/status` to see if containers are running
- **Debug issues**: Use `./dx/logs` or `./dx/logs -f` to view container output
- **Fresh start**: Run `./dx/rebuild` for a complete environment rebuild
- **Database reset**: Use `./dx/reset-db` to completely reset your database with fresh sample data
- **Error handling**: All commands check for Docker availability automatically
- **Database persistence**: PostgreSQL data is persisted via Docker volumes between restarts
- **Flexibility**: Use `./dx/exec` for any Rails commands not covered by specific scripts

## 🏗️ How DX Commands Work

### Architecture Overview

The `dx/` commands provide a unified interface for Docker-based Rails development. Here's how they work behind the scenes:

#### 🔧 **Core Components**

**1. Shared Infrastructure (`dx/_common`)**
```bash
# Common functions used by all commands
check_docker()  # Validates Docker installation and daemon
```

**2. Docker Compose Integration**
- All commands use `docker-compose.dev.yml` for consistency
- Commands execute inside the `app` service container
- Volume mounting enables live code editing

**3. Command Categories**
```bash
# Container Lifecycle
./dx/build → docker-compose build
./dx/start → docker-compose up -d  
./dx/stop → docker-compose down

# Rails Operations  
./dx/dev → docker-compose exec app bundle exec rails server
./dx/console → docker-compose exec app bundle exec rails console
```

#### ⚡ **Command Execution Flow**

1. **Validation** - Check Docker availability (`check_docker()`)
2. **Environment** - Source shared functions from `_common`
3. **Execution** - Run Docker commands with consistent parameters
4. **Feedback** - Provide helpful output and error messages

#### 🐳 **Container Architecture**

**Base Setup (Dockerfile.dev):**
```dockerfile
FROM debian:12                    # Stable base OS
RUN install mise, Ruby, Node.js   # Development tools
RUN mise settings configure       # Fix tool warnings at build time
WORKDIR /root/yoo                 # Consistent working directory
CMD ["sleep", "infinity"]         # Keep container alive for development
```

**Development Workflow:**
- Container runs continuously with `sleep infinity`
- Commands execute via `docker-compose exec app <command>`
- Volume mounts sync local code changes instantly
- PostgreSQL database persists via Docker volumes
- Database health checks ensure proper startup ordering

#### 🎯 **Design Principles**

**1. Consistency**
- All commands follow same structure and error handling
- Standardized output format with emojis and clear messaging
- Common Docker Compose configuration across all operations

**2. Safety**
- Docker availability checks prevent cryptic errors
- Confirmation prompts for destructive operations (`reset-db`)
- Graceful error handling with helpful suggestions

**3. Developer Experience**
- Single-word commands (`build`, `start`, `test`)
- Helpful output showing progress and next steps
- Comprehensive help system (`./dx/help`)

**4. Maintainability**
- Shared functions in `_common` reduce duplication
- Clear separation between container and Rails operations
- Self-documenting command names and structure

### 🔧 Technical Implementation

#### **Error Handling Pattern**
```bash
# Every command follows this pattern:
source "$(dirname "$0")/_common"  # Load shared functions
check_docker                      # Validate environment
echo "🎯 Starting operation..."   # User feedback
docker-compose exec app <cmd>     # Execute in container
echo "✅ Operation complete!"     # Success confirmation
```

#### **Docker Integration**
- **Compose File**: `docker-compose.dev.yml` defines the development environment
- **Multi-Service**: Separate containers for Rails app and PostgreSQL database
- **Volume Mounting**: Live code editing without rebuilds
- **Port Mapping**: Rails server at `localhost:3000`, PostgreSQL at `localhost:5432`
- **Health Checks**: Database readiness validation before app startup
- **Environment Variables**: Consistent Rails and database configuration

#### **Rails Integration**
- **Bundle Exec**: All Rails commands use `bundle exec` for consistency
- **Environment Separation**: Test commands use `RAILS_ENV=test`
- **Database Management**: Separate commands for setup, seeding, and reset operations

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
