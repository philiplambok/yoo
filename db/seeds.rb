# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "🌱 Starting to seed the database..."

# Create Users
puts "👥 Creating users..."
users_data = [
  { email: "admin@example.com" },
  { email: "john.doe@example.com" },
  { email: "jane.smith@example.com" },
  { email: "developer@example.com" },
  { email: "tester@example.com" }
]

users_data.each do |user_attrs|
  User.find_or_create_by!(email: user_attrs[:email]) do |user|
    puts "  ✅ Created user: #{user_attrs[:email]}"
  end
end

# Create Posts
puts "📝 Creating posts..."
posts_data = [
  { title: "Welcome to our Rails Application" },
  { title: "Getting Started with Development" },
  { title: "Best Practices for Ruby on Rails" },
  { title: "Docker Development Environment Setup" },
  { title: "Testing Strategies for Rails Apps" },
  { title: "Deployment and Production Tips" },
  { title: "Performance Optimization Guide" },
  { title: "Security Best Practices" }
]

posts_data.each do |post_attrs|
  Post.find_or_create_by!(title: post_attrs[:title]) do |post|
    puts "  ✅ Created post: #{post_attrs[:title]}"
  end
end

# Create Messages
puts "💬 Creating messages..."
messages_data = [
  { content: "Hello! Welcome to our platform." },
  { content: "Great to have you here!" },
  { content: "Feel free to explore all the features." },
  { content: "If you need help, don't hesitate to ask." },
  { content: "Thanks for joining our community!" },
  { content: "We're constantly improving the platform." },
  { content: "Your feedback is always welcome." },
  { content: "Happy coding!" },
  { content: "Remember to run your tests!" },
  { content: "Don't forget to lint your code." }
]

messages_data.each do |message_attrs|
  Message.find_or_create_by!(content: message_attrs[:content]) do |message|
    puts "  ✅ Created message: #{message_attrs[:content][0..50]}..."
  end
end

# Create Scaffolds (Note: This seems like it might be a test model)
puts "🏗️  Creating scaffolds..."
scaffolds_data = [
  { users: "admin_scaffold" },
  { users: "user_management_scaffold" },
  { users: "content_scaffold" },
  { users: "api_scaffold" },
  { users: "dashboard_scaffold" }
]

scaffolds_data.each do |scaffold_attrs|
  Scaffold.find_or_create_by!(users: scaffold_attrs[:users]) do |scaffold|
    puts "  ✅ Created scaffold: #{scaffold_attrs[:users]}"
  end
end

puts ""
puts "📊 Seeding complete! Summary:"
puts "  👥 Users: #{User.count}"
puts "  📝 Posts: #{Post.count}"
puts "  💬 Messages: #{Message.count}"
puts "  🏗️  Scaffolds: #{Scaffold.count}"
puts ""
puts "🎉 Database seeded successfully!"
