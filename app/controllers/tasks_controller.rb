class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    # to show each task in a different file, depending on its id
  end

  def new
    @task = Task.new
    # I am creating a brand new task
  end

  def create
    #authenticity token!!!!
    Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
    # but here not a new one, but take an existing one
    # we need then to take the id as in show
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

# protecting you against hacker and filter the parameters
  private
  def task_params
    params.require(:task).permit(:name, :pain)

  end
end
