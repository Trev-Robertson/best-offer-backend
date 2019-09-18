class Specialty < ApplicationRecord
    has_many :contractors_specialties
    has_many :contractors, through: :contractors_specialties
    has_many :tasks
end
