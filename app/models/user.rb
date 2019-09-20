class User < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :contractors, through: :reviews




        def self.all_users_serializer
            User.all.to_json( {
                    :only => [:id, :name],
                    :include => {:tasks => 
                        {
                            :only => [:name, :description, :specialty_id], 
                                :include => {:specialty => 
                                {
                                :only => [:name, :id]
                                },
                                :bids => 
                                {
                                :only => [:name, :price, :status, :contractor_id],
                                    :include => {
                                        :contractor => {
                                            :only => [:name, :id]
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
                    :only => [:id, :name],
                    :include => {:tasks => 
                        {
                            :only => [:name, :description, :specialty_id], 
                                :include => {:specialty => 
                                {
                                :only => [:name, :id]
                                },
                                :bids => 
                                {
                                :only => [:name, :price, :status, :contractor_id],
                                    :include => {
                                        :contractor => {
                                            :only => [:name, :id]
                                        }
                                    }
        
                                } 
                                
        
                                }
        
                        }
                    }
                })
        end




end
