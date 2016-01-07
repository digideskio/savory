class ListsController < ApplicationController
  before_action :set_list, only: [:show, :share, :edit, :update, :destroy]
  skip_before_filter :require_user, :only => [:share]

  def home
    render :home
  end

  # GET /lists
  # GET /lists.json
  def index
    @lists = @current_user.lists
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  def share
    @list = List.find(params[:id])
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    @current_user.lists << @list

    if @list.save
      flash[:success] = 'List was successfully created.'
      redirect_to lists_url
    else
      flash[:danger] = 'Whoops, that didn\'t work!'
      render 'new'
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    if @list.update(list_params)
      flash[:success] = 'List was successfully updated.'
      redirect_to @list
    else
      flash[:danger] = 'Whoops, that didn\'t work!'
      render 'edit'
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    flash[:success] = 'List was successfully deleted.'
    redirect_to lists_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :description)
    end
end
