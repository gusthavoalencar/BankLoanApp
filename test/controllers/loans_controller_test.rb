# frozen_string_literal: true

require 'test_helper'

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans(:one)
    @user = users(:one)
  end

  test 'should get index' do
    get loans_url
    assert_response :success

    assert_select 'h1', text: 'Loans'
    assert_select 'a', text: 'Create Loan'
  end

  test 'should get new' do
    get new_loan_url
    assert_response :success
  end

  test 'should create loan' do
    assert_difference('Loan.count', 1) do
      post loans_url, params: {
        loan: {
          amount: 10_000,
          interest_rate: 12,
          status: 'Pending',
          user_id: @user.id
        }
      }
    end

    assert_redirected_to loan_url(Loan.last)
    follow_redirect!
  end

  test 'should show loan' do
    get loan_url(@loan)
    assert_response :success

    assert_select 'h1', text: 'Loan Details'
  end

  test 'should get edit' do
    get edit_loan_url(@loan)
    assert_response :success
  end

  test 'should update loan' do
    patch loan_url(@loan), params: {
      loan: {
        amount: 15_000,
        interest_rate: 10,
        status: 'Approved'
      }
    }
    assert_redirected_to loan_url(@loan)
    follow_redirect!
  end

  test 'should destroy loan' do
    assert_difference('Loan.count', -1) do
      delete loan_url(@loan)
    end

    assert_redirected_to loans_url
    follow_redirect!
  end
end
