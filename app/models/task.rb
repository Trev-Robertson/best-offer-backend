class Task < ApplicationRecord
  belongs_to :user
  belongs_to :specialty
  has_many :bids, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  accepts_nested_attributes_for :bids

end
