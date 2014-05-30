# encoding: utf-8

class GadgetPhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Create different versions of your uploaded files:
  version :small do
    process resize_to_fill: [180, 180], if: :square?
    process resize_to_fill: [320, 180], if: :not_square?
  end

  version :medium do
    process resize_to_fill: [460, 460], if: :square?
    process resize_to_fill: [640, 460], if: :not_square?
  end

  version :large do
    process resize_to_fill: [720, 720], if: :square?
    process resize_to_fill: [1280, 720], if: :not_square?
  end

  private

    # Checks if image is a square
    def square? file
      img = Magick::Image.read(file.path)
      img[0].columns == img[0].rows
    end

    # Oposite to #square?
    def not_square? file
      !square? file
    end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
