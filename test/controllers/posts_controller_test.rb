require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @post = posts(:lorem)
  end

  test "should redirect if not logged in" do
    assert_no_difference 'Post.count' do
      delete post_path(@post)
    end
    assert_redirected_to login_url
  end
end
