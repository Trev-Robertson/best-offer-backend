class Contractor < ApplicationRecord
    has_many :contractors_specialties
    has_many :specialties, through: :contractors_specialties
    has_many :bids, dependent: :destroy
    has_many :tasks, through: :bids
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews
    has_secure_password




    def self.all_contractors_serializer
        Contractor.all.to_json( {
                :only => [:id, :name, :img_url],
                     :include => {
                        :reviews => 
                        {
                            :only => [:id, :user_id, :content, :stars, :created_at], 
                                :include => {:user => 
                                    {
                                         :only => [:name, :id, :img_url]
                                    }
        
                                }
                        },
                        :bids => 
                        {
                            :only => [:id, :status, :price],
                                :include => {
                                    :task =>
                                    {
                                    :only => [:name, :user_id, :task_done, :id],
                                    :include => {
                                        :bids =>
                                        {
                                        :only => [:id, :status, :price, :status]
                                            
                                        }
                                    }
                                    }
                                }
                        },
                        :specialties => 
                        {
                            :only => [:id, :name],
                        }
                            
                    }
           
                    
        })

    end



    def contractor_serializer
       self.to_json( {
                :only => [:id, :name, :img_url ],
                     :include => {
                        :reviews => 
                        {
                            :only => [:id, :user_id, :content, :stars, :created_at], 
                                :include => {:user => 
                                    {
                                         :only => [:name, :id, :img_url]
                                    }
        
                                }
                        },
                        :bids => 
                        {
                            :only => [:id, :status, :price],
                                :include => {
                                    :task =>
                                    {
                                    :only => [:name, :user_id, :task_done, :id],
                                    :include => {
                                        :bids =>
                                        {
                                        :only => [:id, :status, :price, :status]
                                            
                                        }
                                    }
                                    }
                                }
                        },
                        :specialties => 
                        {
                            :only => [:id, :name],
                        }
                            
                    }
           
                    
        })

    end


end
