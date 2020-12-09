require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:vasya)
    @post = @user.posts.build(content: "Lorem ipsum dolorem")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "content should be present" do
    @post.content = "   "
    assert_not @post.valid?
  end

  test "content should be at most 256 chars" do
    @post.content = "r" * 257
    assert_not @post.valid?
  end

  test "order should be recent first" do
    assert_equal posts(:most_recent), Post.first
  end
end
