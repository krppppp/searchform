CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAWHCSXGE5GMMW6RV6',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1',  # Tokyoの場合
  }
  config.cache_storage = :fog # キャッシュにS3を指定

  # 環境毎にバケットを分けます
  case Rails.env
  when 'production'
    config.fog_directory  = 'yugio'
  when 'staging'
    config.fog_directory  = 'yugio'
  when 'development'
    config.fog_directory  = 'yugio'
  when 'test'
    config.fog_directory  = 'yugio'
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/