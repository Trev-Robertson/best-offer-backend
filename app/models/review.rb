class Review < ApplicationRecord
  belongs_to :user
  belongs_to :contractor
  validates :content, presence: true
  validates :stars, presence: true
end
