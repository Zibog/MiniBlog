require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:vasya)
  end

  test "unsuccsessful edit" do
    get edit_user_path(id: @user.id)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "", email: "abc@net", password: "foo",
                                              password_confirmation: "bar" } }
    assert_template 'users/edit'
  end
end
