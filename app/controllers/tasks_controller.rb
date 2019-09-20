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
            user = User.find()
        Task.create(tasks_params) 

        render json: 

    end


    private

        def tasks_params
            params.require(:task).permit(:description, :name, :user_id, :specialty_id)
        end


end
