class Bid < ApplicationRecord
  belongs_to :task
  belongs_to :contractor
  
end
