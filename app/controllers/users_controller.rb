class UsersController < ApplicationController


    def index
        users = User.all
        render json: users.to_json(user_serializer)
    end

    def show
        
        user = User.find_by(name: params[:id])
       
        render json: user.to_json(user_serializer)
    end


    private

    def user_serializer
        {
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
        }
    end


end



