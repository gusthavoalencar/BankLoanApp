# frozen_string_literal: true

class CreateLoans < ActiveRecord::Migration[7.1] # rubocop:todo Style/Documentation
  def change
    create_table :loans do |t|
      t.decimal :amount
      t.string :status
      t.decimal :interest_rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
