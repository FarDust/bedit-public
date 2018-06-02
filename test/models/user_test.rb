require('test_helper')

class UserTest < ActiveSupport::TestCase
  should have_many(:assignments)
  should have_many(:roles).through(:assignments)
  # test "the truth" do
  #   assert true
  # end
end
