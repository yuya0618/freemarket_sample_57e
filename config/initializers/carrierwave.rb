require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage :file
  else
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'mercari57e'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercari57e'
    config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.aws[:aws_access_key_id],
    aws_secret_access_key: Rails.application.credentials.aws[:aws_secret_access_key],
    region: 'ap-northeast-1'
    }
  end
end