
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
            user = User.find(tasks_params[:user_id])

        Task.create(tasks_params) 

        render json: user.user_serializer
    end

    def destroy
        Task.find(params[:id]).destroy
      
        render json: User.find(params[:user_id]).user_serializer
    end


    private

        def tasks_params
            params.require(:task).permit(:description, :name, :user_id, :specialty_id)
        end


end
