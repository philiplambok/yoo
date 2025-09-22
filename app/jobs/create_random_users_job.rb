class CreateRandomUsersJob < ApplicationJob
  queue_as :default

  def perform
    Rails.logger.info "Starting to create 5 random users..."
    
    5.times do |i|
      user = User.create!(
        email: "user#{rand(1000..9999)}@example.com"
      )
      Rails.logger.info "Created user #{i + 1}: #{user.email}"
    end
    
    Rails.logger.info "Successfully created 5 random users!"
  end
end
