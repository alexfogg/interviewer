CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                               # required
    :aws_access_key_id      => ENV['AKIAJJNWJ6LL4LYSI4OQ'],                       # required
    :aws_secret_access_key  => ENV['"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"'],                       # required
    :region                 => 'us-east-1'                          # optional, defaults to 'us-east-1'
  }
  # config.fog_directory  = 'temp-cm'                                 # required
  config.fog_public     = false                                     # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  # config.asset_host   = 'https://assets.example.com'              # optional, defaults to nil
end
 
CarrierWave.configure {|config| config.fog_directory = 'Underdogs_Interviewer'} if Rails.env.development?
CarrierWave.configure {|config| config.fog_directory = 'Underdogs_Interviewer'} if Rails.env.test?
CarrierWave.configure {|config| config.fog_directory = 'Underdogs_Interviewer'} if Rails.env.production?