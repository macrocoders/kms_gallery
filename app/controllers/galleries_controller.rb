class GalleriesController < Kms::ApplicationController
  def index
    render json: Gallery.order(:created_at).to_json
  end

  def create
    file_arr = params.values.find_all { |value| value.class == ActionDispatch::Http::UploadedFile }
    gallery_params[:images] = file_arr
    @gallery = Gallery.new(gallery_params)
    @gallery.save
    render json: @gallery.to_json
  end

  def update
    file_arr = params.values.find_all { |value| value.class == ActionDispatch::Http::UploadedFile }
    gallery_params[:images] = file_arr
    @gallery = Gallery.find(params[:id])
    @gallery.update_attributes(gallery_params)
    render json: @gallery.to_json
  end

  def show
    @gallery = Gallery.find(params[:id])
    render json: @gallery.to_json
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    render json: {}, status: :no_content
  end

  protected

  def gallery_params
    params.require(:gallery).permit!
  end
end
