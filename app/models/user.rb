class User < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :contractors, through: :reviews
end
