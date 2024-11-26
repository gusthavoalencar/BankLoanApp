# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should get index' do
    get users_url
    assert_response :success

    assert_select 'h1', text: 'Users'
    assert_select 'a', text: 'New User'
  end

  test 'should get new' do
    get new_user_url
    assert_response :success

    assert_select 'h1', text: 'Create User'
  end

  test 'should create user' do
    assert_difference('User.count', 1) do
      post users_url, params: {
        user: {
          firstName: 'TestUserOneFirstName',
          lastName: 'TestUserOneLastName',
          email: 'testuseroneemail@gmail.com',
          phoneNumber: 123_123_123
        }
      }
    end

    assert_redirected_to user_url(User.last)
    follow_redirect!
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success

    assert_select 'h1', text: 'User Details'
  end

  test 'should get edit' do
    get edit_user_url(@user)
    assert_response :success

    assert_select 'h1', text: 'Edit User'
  end

  test 'should update user' do
    patch user_url(@user), params: {
      user: {
        firstName: 'UpdatedUserOneName'
      }
    }
    assert_redirected_to user_url(@user)
    @user.reload
    assert_equal 'UpdatedUserOneName', @user.firstName
    follow_redirect!
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
    follow_redirect!
  end
end
