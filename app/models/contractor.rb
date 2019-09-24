class Contractor < ApplicationRecord
    has_many :contractors_specialties
    has_many :specialties, through: :contractors_specialties
    has_many :bids, dependent: :destroy
    has_many :tasks, through: :bids
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews




    



end
