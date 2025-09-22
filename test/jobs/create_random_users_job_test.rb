require "test_helper"

class CreateRandomUsersJobTest < ActiveJob::TestCase
  test "should create 5 random users" do
    initial_user_count = User.count

    # In test environment, jobs run inline (synchronously)
    CreateRandomUsersJob.perform_now

    assert_equal initial_user_count + 5, User.count
  end

  test "should perform job immediately with inline adapter" do
    initial_user_count = User.count

    # With inline adapter, perform_later executes immediately
    CreateRandomUsersJob.perform_later

    # Job should have completed immediately, creating 5 users
    assert_equal initial_user_count + 5, User.count
  end
end
