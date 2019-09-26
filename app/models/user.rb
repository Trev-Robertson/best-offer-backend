class User < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :contractors, through: :reviews
    has_secure_password
    validates :name, uniqueness: { case_sensitive: false }




        def self.all_users_serializer
            User.all.to_json( {
                    :only => [:id, :name, :img_url ],
                    :include => {:tasks => 
                        {
                            :only => [:id, :name, :description, :specialty_id], 
                                :include => {:specialty => 
                                {
                                :only => [:name, :id]
                                },
                                :bids => 
                                {
                                :only => [:id, :name, :price, :status, :contractor_id],
                                    :include => {
                                        :contractor => {
                                            :only => [:name, :id, :img_url]
                                        }
                                    }
        
                                } 
                                
        
                                }
        
                        }
                    }
                })

        end



        def user_serializer
                self.to_json( {
                    :only => [:id, :name, :img_url],
                    :include => {:tasks => 
                        {
                            :only => [:id, :name, :description, :specialty_id], 
                                :include => {:specialty => 
                                {
                                :only => [:name, :id]
                                },
                                :bids => 
                                {
                                :only => [:id, :name, :price, :status, :contractor_id],
                                    :include => {
                                        :contractor => {
                                            :only => [:name, :id, :img_url]
                                        }
                                    }
        
                                } 
                                
        
                                }
        
                        }
                    }
                })
        end




end
