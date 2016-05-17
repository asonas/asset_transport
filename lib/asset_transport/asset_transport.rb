module AssetTransport
  class << self

    def config=(data)
      @config = data
    end

    def config
      @config ||= Config.new
      @config
    end

    def storage
      @storage ||= Storage.new(self.config)
    end

    def sync
      self.storage.sync
    end
  end
end
