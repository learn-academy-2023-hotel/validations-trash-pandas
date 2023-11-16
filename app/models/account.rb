class Account < ApplicationRecord
    validates :username, :email, :password, presence: true
    validates :username, length: { minimum: 5 }
    validates :password, length: { minimum: 5 }
    validates :username, uniqueness: true
end
