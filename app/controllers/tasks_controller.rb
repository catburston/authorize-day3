class TasksController < ApplicationController

  before_filter :authenticate

  def new
    @task       = Task.new
    @project_id = params[:project_id]
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    authorize @task

    if @task.save
      redirect_to projects_url, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    authorize @task
  end

  def update
    @task = Task.find(params[:id])
    authorize @task

    if @task && @task.update(task_params)
      redirect_to projects_url, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params[:task].permit(:project_id, :name, :status)
    end
end
