class AlbumsController < ApplicationController
  def show
    @band = Band.find_by(id: params[:id])
    @album = Album.find_by(band_id: params[:id])
    render :show
  end

  def new
    @band = Band.find_by(id: params[:id])
    @album = Album.new
    render :new
  end

  def create
    @band = Band.find_by(id: params[:id])
    @album = Album.new(album_params)
    @album.band_id = @band.id
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(album_params)
    render :edit
  end

  def update
    @album = Album.find(album_params)
    
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(album_params)
    if @album.destroy!
      flash[:success] = "UNLIVENED!"
      redirect_to albums_url
    else
      flash.now[:errors] = "Album: 1, You: 0"
      render :index
    end
  end

  private
  def album_params
    params.require(:album).permit(:name)
  end
end
