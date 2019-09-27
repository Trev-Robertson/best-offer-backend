
class TasksController < ApplicationController


    def index
        tasks = Task.all
        render json: tasks
    end

    def show
        task = Task.find(params[:id])
        render json: task
    end
    def create
        byebug
        user = User.find(task_params[:user_id])
        
        Task.create(tasks_params) 
        
        render json: user.user_serializer
    end

    def update
        
        bid = Bid.find(task_params[:bids_attributes]['id'])
        bid.update(task_params[:bids_attributes])
        task = Task.find(task_params[:id])
        task.update(task_params)
       
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
