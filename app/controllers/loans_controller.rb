# frozen_string_literal: true

class LoansController < ApplicationController
  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      redirect_to @loan, notice: 'Loan was successfully created.'
    else
      render :new
    end
  end

  def index
    @loans = Loan.all
  end

  def show
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:amount, :interest_rate, :status, :user_id)
  end

  def edit
    @loan = Loan.find(params[:id])
  end

  def update
    @loan = Loan.find(params[:id])
    if @loan.update(loan_params)
      redirect_to @loan, notice: 'Loan was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy
    redirect_to loans_path, notice: 'Loan was successfully deleted.'
  end

end
