class TodosController < ApiController
  before_action :authenticate_user!, :check_permission
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def check_permission
    @list =TaskList.find(params[:task_list_id])
    @share = ShareTask.new
    if @list.blank?
      head :not_found
    else
      if @list.user_id != current_user.id
        @share = ShareTask.find_by_task_list_id_and_user_id(@list.id,current_user.id)
        head :not_found if @share.blank?
      end
    end
  end

  # GET /todos
  # GET /todos.json
  def index
    @todos = @list.todos
    render json: @todos
  end

  def search
    return head :bad_request unless params.has_key?(:name) && params[:name].blank?
    @todos = Todos.where('name LIKE ?', "%#{params[:name]}%")
    render :index
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)
    @todo.task_list_id = @list.id
    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created}
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
      return head :forbidden if @list.user_id != current_user.id && @share.is_write != true
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:name, :done, :task_list_id)
    end
end
