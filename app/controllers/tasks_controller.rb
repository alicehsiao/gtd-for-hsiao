class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:completion_date).reverse_order
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
      render :notfound, status: :not_found
    end
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id].to_i)

    if @task.nil?
      render :notfound, status: :not_found
    end
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def update
    task = Task.find(params[:id].to_i)
    task.update(task_params)

    if task.save
      redirect_to task_path
    else
      render :edit
    end
  end

  def complete
    task = Task.find(params[:id].to_i)
    if task.completion_date == nil
      task.completion_date = Date.current
      task.status = "Unmark Complete"
    else
      task.completion_date = nil
      task.status = "Mark Complete"
    end

    if task.save
      redirect_to tasks_path
    end
  end

  def destroy
    task = Task.find_by(id: params[:id].to_i)
    task.destroy

    redirect_to root_path
  end

  private
  def task_params
    return params.require(:task).permit(:name, :description)
  end
end
