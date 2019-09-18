class TasksController < ApplicationController


    def index
        tasks = Task.all
        render json: task
    end

    def show
        task = task.find(params[:id])
        render json: task
    end

end
