require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:vasya)
  end

  test "post interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    post posts_path, params: { post: { content: "" } }
    assert_select 'div#error_explanation'
    # Correct pagination link
    assert_select 'a[href=?]', '/?page=2'
    # Vlid submission
    content = "Take a break, bro"
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete post
    assert_select 'a', 'Delete'
    first_post = @user.posts.paginate(page: 1).first
    assert_difference 'Post.count', -1 do
      delete post_path(first_post)
    end
    # Visit different user and see no delete links
    get user_path(users(:petya))
    assert_select 'a', text: 'Delete', count: 0
  end
end
