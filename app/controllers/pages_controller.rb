class PagesController < ApplicationController
  def home
    @loans = Loan.includes(:user).all
    @loans_by_status = Loan.group(:status).count
    @total_amount_by_status = Loan.group(:status).sum(:amount)
  end
end
