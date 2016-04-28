class ToolsController < ApplicationController
  # helper_method :tool_chest_not_empty?, :most_recent_tool
  before_action :set_tool, only: [:show, :destroy]

  def index
    # cookies[:hit_counter] = cookies[:hit_counter].to_i + 1
    session[:hit_counter] = session[:hit_counter].to_i + 1
    if session[:hit_counter].to_i.even?
      flash[:alert] = "Hit counter is even!"
    else
      flash[:alert] = "Hit counter is odd"
    end
    # session[:most_recent_tool_id] = Tool.last.id
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @category = @tool.category
    if @tool.save
      redirect_to tool_path(@tool.id) 
      flash[:notice] = "Success!"
    else
      render :new
      flash[:error] = @tool.error.full_messages.join(", ")
    end
  end

  def show
  end

  def destroy
    tool.destroy
    redirect_to tools_path # represents index page, can't send back to tool specific page since it has been deleted
  end

  private

  def tool_params # typically named as 'singular entity_params'
    params.require(:tool).permit(:name, :price, :quantity, :category_id)
    # params.require(:tool) => accesses sub hash key-value pair
    # permitting only three attributes to be submitted
  end

  def set_tool
    @tool = Tool.find(params[:id])
  end

  # def most_recent_tool
  #   Tool.find(session[:most_recent_tool_id]).name
  # end
  #
  # def tool_chest_not_empty?
  #   @tools != nil
  # end

end
