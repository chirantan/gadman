class Photo < ActiveRecord::Base
  mount_uploader :gadget_photo, GadgetPhotoUploader
  belongs_to :gadget
end
