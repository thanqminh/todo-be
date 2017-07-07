class ShareTasksController < ApiController
  before_action :authenticate_user!, :check_permission
  before_action :set_share_task, only: [:show, :edit, :update, :destroy]


  def check_permission
    @list = TaskList.find(params[:task_list_id])
    head :not_found if (@list.blank? || @list.user_id != current_user.id)
  end

  # GET /share_tasks
  # GET /share_tasks.json
  def index
    @share_tasks = @list.share_tasks
  end

  # GET /share_tasks/1
  # GET /share_tasks/1.json
  def show
  end

  # GET /share_tasks/new
  def new
    @share_task = ShareTask.new
  end

  # GET /share_tasks/1/edit
  def edit
  end

  # POST /share_tasks
  # POST /share_tasks.json
  def create
    @share_task = ShareTask.new(share_task_params)
    @share_task.task_list_id = params[:task_list_id]
    respond_to do |format|
      if @share_task.save
        format.html { redirect_to @share_task, notice: 'Share task was successfully created.' }
        format.json { render :show, status: :created}
      else
        format.html { render :new }
        format.json { render json: @share_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /share_tasks/1
  # PATCH/PUT /share_tasks/1.json
  def update
    respond_to do |format|
      if @share_task.update(share_task_params)
        format.html { redirect_to @share_task, notice: 'Share task was successfully updated.' }
        format.json { render :show, status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @share_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /share_tasks/1
  # DELETE /share_tasks/1.json
  def destroy
    @share_task.destroy
    respond_to do |format|
      format.html { redirect_to share_tasks_url, notice: 'Share task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share_task
      @share_task = ShareTask.find_by_task_list_id_and_user_id(params[:task_list_id], params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_task_params
      params.require(:share_task).permit(:user_id, :task_list_id, :is_write)
    end
end
