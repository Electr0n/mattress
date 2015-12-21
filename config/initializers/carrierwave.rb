CarrierWave.configure do |config|
  config.storage = :file
=begin
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJNDVGMMTFKMEOHOA',       # required
    :aws_secret_access_key  => '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',       # required
    #:region                 => 'eu-west-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'bucket-matras'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  #config.asset_host     = 'https://assets.example.com'            # optional, defaults to nil
=end
end
CarrierWave::Uploader::DefaultUrl.module_eval do
  def default_url
    #"/assets/images/missing/mattresses/" + [version_name, "default.png"].compact.join('_')
    '/img/missing.png'
  end
end
