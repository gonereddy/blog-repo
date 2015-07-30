CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIEMGLD7P5RM72S5A',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'us-west-2',                  # optional, defaults to 'us-east-1'
    host:                  's3.amazonaws.com',             # optional, defaults to nil
    endpoint:              'https://rankblogs.s3.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'rankblogs'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end