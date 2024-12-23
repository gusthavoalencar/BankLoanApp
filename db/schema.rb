# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_241_030_202_720) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'loans', force: :cascade do |t|
    t.decimal 'amount'
    t.string 'status'
    t.decimal 'interest_rate'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_loans_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'firstName'
    t.string 'lastName'
    t.string 'email'
    t.integer 'phoneNumber'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'loans', 'users'
end
