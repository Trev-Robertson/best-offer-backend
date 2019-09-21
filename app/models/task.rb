class Task < ApplicationRecord
  belongs_to :user
  belongs_to :specialty
  has_many :bids, dependent: :destroy
end