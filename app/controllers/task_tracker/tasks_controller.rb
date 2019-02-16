class TaskTracker::TasksController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :set_task, only: [:show, :update, :destroy]

  def index
    @tasks = TaskTracker::Task.where(story_id: params.require(:story_id))
  end

	# GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = TaskTracker::Task.new(task_params)

    if @task.save
      render :show, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    if @task.update(task_params)
      render :show, status: :ok, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = TaskTracker::Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      args = params.require(:task).permit(:story_id, :name, :completed)
      args[:project_id] = TaskTracker::Story.find(args[:story_id]).project_id

      return args
    end
end
