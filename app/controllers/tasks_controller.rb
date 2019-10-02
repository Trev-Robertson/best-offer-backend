
class TasksController < ApplicationController


    def index
        tasks = Task.all
        render json: tasks.all_tasks_serializer
    end

    def show
        task = Task.find(params[:id])
        render json: task.task_serializer
    end
    def create
      
        user = User.find(task_params[:user_id])
        Task.create(task_params) 
        
        render json: user.user_serializer
    end

    def update
        boot_twilio
        bid = Bid.find(task_params[:bids_attributes]['id'])
        bid.update(task_params[:bids_attributes])
       
        task = Task.find(task_params[:id])
        task.update(task_params)
        contractor = Contractor.find(bid.contractor_id)
        from_number = contractor.phone_number
        from_number.blank? ?  from_number = Rails.application.credentials.my_number : from_number
        @client.messages.create(from: Rails.application.credentials.twilio_number, to: from_number, 
        body: "Congrats! Your Bid of $#{bid.price} for Task '#{task.name}' Was Accepted!" )
       
          render json: User.find(task_params[:user_id]).user_serializer
      end

    def destroy
        Task.find(params[:id]).destroy
      
        render json: User.find(task_params[:user_id]).user_serializer
    end


    private

        def task_params
            params.require(:task).permit(:id, :description, :name, :user_id, :specialty_id, :task_done, bids_attributes: [:id, :task_id, :contractor_id, :price, :status])
        end


end
