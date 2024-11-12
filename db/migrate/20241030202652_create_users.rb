# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1] # rubocop:todo Style/Documentation
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.integer :phoneNumber

      t.timestamps
    end
  end
end
