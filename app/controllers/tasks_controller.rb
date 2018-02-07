class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tasks = set_project.tasks.all
  end

  def show

  end

  def new
    @task = set_project.tasks.new
  end

  def edit
  end

  def create
    @task = set_project.tasks.create(task_params)
    redirect_to @project
  end

  def update
    if @task.update(task_params)
      redirect_to project_task_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end

  end

  def complete
        @task.update_attribute(:completed, True)
        redirect_to @project, notice: "Task completed"
    end

  def destroy
    if @task.destroy
            flash[:success] = "Project task was deleted"
        else
            flash[:error] = "Project task could not be deleted"
        end
    redirect_to @project
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :deadline, :priority, :completed)
    end
end
