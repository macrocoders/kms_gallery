module Kms
  module Gallery
    class GalleriesController < ApplicationController
      def index
        render json: Gallery.order(:position).to_json
      end

      def create
        @gallery = Gallery.new(gallery_params)
        @gallery.save
        render json: @gallery.to_json
      end

      def update
        @gallery = Gallery.find(params[:id])
        @gallery.update_attributes(gallery_params)
        render json: @gallery.to_json
      end

      def show
        @gallery = Gallery.find(params[:id])
        render json: @gallery.to_json(include: :pictures)
      end

      def destroy
        @gallery = Gallery.find(params[:id])
        @gallery.destroy
        render json: {}, status: :no_content
      end

      def pictures_create
        @picture = Picture.new(picture_params)
        if @picture.save
          render json: @picture.to_json
        else 
          render json: @picture.errors, status: :unprocessable_entity
        end    
      end

      def picture_destroy
        @picture = Picture.find(params[:id])
        @picture.destroy
        render json: {}, status: :no_content
      end

      protected

      def gallery_params
        params.require(:gallery).permit!
      end

      def picture_params
        params.require(:picture).permit!
      end
    end
  end  
end  
