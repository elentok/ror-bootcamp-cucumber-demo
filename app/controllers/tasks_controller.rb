class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    task = Task.new(params[:task])
    if task.save
      render json: task
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end
end
