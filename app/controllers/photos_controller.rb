class PhotosController < ApplicationController

  def index
    gadget
  end

  def create
    logger.debug "BLUB" * 100
    if gadget.photos.create! :gadget_photo => params[:photos][:gadget_photo]
      message = {notice: 'Photo upload successful!'}
    else
      message = {error: 'Photo upload failed!'}
    end
    logger.debug "BLUB" * 100
    redirect_to gadget_photos_path(gadget), message
  end

  private

  def gadget
    @gadget ||= Gadget.find(params[:gadget_id])
  end

end
