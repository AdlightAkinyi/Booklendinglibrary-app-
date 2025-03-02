class ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers  

  class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end
