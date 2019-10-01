class Task < ApplicationRecord
  belongs_to :user
  belongs_to :specialty
  has_many :bids, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  accepts_nested_attributes_for :bids



  def self.all_tasks_serializer
    Task.all.to_json( {
            :only => [:id, :name, :user_id, :specialty, :task_done, :description  ],
            :include => {
                :user => 
                {
                    :only => [:id, :name]

                }, 
                :bids =>
                {
                  :only => [:id, :price, :status]
                }
            }
        })

  end



def task_serializer
        self.to_json( {
          :only => [:id, :name, :user_id, :specialty, :task_done, :description ],
          :include => {
              :user => 
              {
                  :only => [:id, :name]

              }, 
              :bids =>
              {
                :only => [:id, :price, :status]
              }
          }
      })
end







end
