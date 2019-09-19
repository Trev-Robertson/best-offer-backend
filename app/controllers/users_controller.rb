class UsersController < ApplicationController


    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
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



