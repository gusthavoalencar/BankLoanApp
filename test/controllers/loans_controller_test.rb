# frozen_string_literal: true

require 'test_helper'

class LoansControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get loans_new_url
    assert_response :success
  end

  test 'should get create' do
    get loans_create_url
    assert_response :success
  end

  test 'should get index' do
    get loans_index_url
    assert_response :success
  end

  test 'should get show' do
    get loans_show_url
    assert_response :success
  end
end
