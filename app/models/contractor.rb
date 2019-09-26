class Contractor < ApplicationRecord
    has_many :contractors_specialties
    has_many :specialties, through: :contractors_specialties
    has_many :bids, dependent: :destroy
    has_many :tasks, through: :bids
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews




    def self.all_contractors_serializer
        Contractor.all.to_json( {
                :only => [:id, :name ],
                     :include => {
                        :reviews => 
                        {
                            :only => [:id, :user_id, :content, :stars, :created_at], 
                                :include => {:user => 
                                    {
                                         :only => [:name, :id]
                                    }
        
                                }
                        },
                        :bids => 
                        {
                            :only => [:id],
                                :include => {:task =>
                                    {
                                    :only => [:name, :user_id]
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
                :only => [:id, :name ],
                     :include => {
                        :reviews => 
                        {
                            :only => [:id, :user_id, :content, :stars, :created_at], 
                                :include => {:user => 
                                    {
                                         :only => [:name, :id]
                                    }
        
                                }
                        },
                        :bids => 
                        {
                            :only => [:id],
                        },
                        :specialties => 
                        {
                            :only => [:id, :name],
                        }
                            
                    }
           
                    
        })

    end


end
