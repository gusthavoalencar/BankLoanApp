class User < ApplicationRecord
    has_many :loans, dependent: :destroy
end
