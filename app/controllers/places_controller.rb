class PlacesController < ApplicationController
  before_action :set_place, only: [:edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = @current_user.places
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    if (place_params[:url].length > 0 and
      place_params[:url][0..6] != "http://" and
      place_params[:url][0..7] != "https://")
      place_params[:url].insert(0, "http://")
    end

    @place = Place.new(place_params)
    @list = List.find(params[:list_id][:id])
    @list.places << @place
    @current_user.places << @place

    if @place.save
      flash[:success] = 'Place was successfully created.'
      redirect_to @list
    else
      flash[:danger] = 'Whoops, that didn\'t work!'
      render 'new'
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    if (place_params[:url].length > 0 and
      place_params[:url][0..6] != "http://" and
      place_params[:url][0..7] != "https://")
      place_params[:url].insert(0, "http://")
    end

    if @place.update(place_params)
      flash[:success] = 'Place was successfully updated.'
      redirect_to lists_url
    else
      flash[:danger] = 'Whoops, that didn\'t work!'
      render 'edit'
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @list = @place.list
    @place.destroy
    flash[:success] = 'Place was successfully deleted.'
    redirect_to @list
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :location, :url)
    end
end
