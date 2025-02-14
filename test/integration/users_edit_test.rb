require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:vasya)
  end

  test "unsuccsessful edit" do
    log_in_as(@user)
    get edit_user_path(id: @user.id)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "", email: "abc@net", password: "foo",
                                              password_confirmation: "bar" } }
    assert_template 'users/edit'
  end

  test "succsessful edit" do
    log_in_as(@user)
    get edit_user_path(id: @user.id)
    assert_template 'users/edit'
    name = "Misha Ptichkin"
    email = "mi@sha.pt"
    patch user_path(@user), params: { user: { name: name, email: email, password: "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

  test "succsessful edit with friendly forwarding" do
    get edit_user_path(id: @user.id)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    name = "Misha Ptichkin"
    email = "mi@sha.pt"
    patch user_path(@user), params: { user: { name: name, email: email, password: "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
