module AssetTransport

  class Config
    attr_accessor :access_key_id, :secret_access_key, :region

    def initialize(confg)
      self.region = config[:region]
      self.access_key_id = config[:access_key_id]
      self.secret_access_key = config[:secret_access_key]
    end

    def manifest_path
      directory = Rails.application.config.assets.manifest
      File.join(directory, "manifest.yml")
    end

    def assets_prefix
      "assets"
    end

    def public_path
      Rails.public_path
    end
  end

end
