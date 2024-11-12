# frozen_string_literal: true

class User < ApplicationRecord
  has_many :loans, dependent: :destroy
end
