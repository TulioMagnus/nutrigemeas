# frozen_string_literal: true

class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  def default_url(*_args)
    ActionController::Base.helpers.asset_path("fallback/#{[version_name, 'default.png'].compact.join('_')}")
  end
  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  ## Tamanhos que o CarrierWave vai salvar as imagens

  # Thumb
  version :thumb do
    process resize_to_limit: [50, 50]
  end

  # Medium
  version :medium do
    process resize_to_fit: [150, 150]
  end

  # Big
  version :big do
    process resize_to_fit: [300, 300]
  end

  # Tipos de extensão aceitas
  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
