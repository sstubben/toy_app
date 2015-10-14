require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  setup do
  	@zero_micropost = Micropost.new
  	@micropost = microposts(:one)
  end

  test "should be valid" do
  	assert @micropost.valid?
  end


end
