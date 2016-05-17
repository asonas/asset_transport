module AssetTransport
  class Storage

    def sync
      log "AssetSync: Syncing."
      upload_files
      delete_extra_remote_files unless keep_existing_remote_files?
      log "AssetSync: Done."
    end

    def upload_files
      remote_files = ignore_existing_remote_files? ? [] : get_remote_files

      local_files_to_upload = local_files - ignored_files - remote_files + always_upload_files
      local_files_to_upload = (local_files_to_upload + get_non_fingerprinted(local_files_to_upload)).uniq

      local_files_to_upload.each do |f|
        next unless File.file? "#{path}/#{f}" # Only files.
        upload_file f
      end

      if self.config.cdn_distribution_id && files_to_invalidate.any?
        log "Invalidating Files"
        cdn ||= Fog::CDN.new(self.config.fog_options.except(:region))
        data = cdn.post_invalidation(self.config.cdn_distribution_id, files_to_invalidate)
        log "Invalidation id: #{data.body["Id"]}"
      end
    end

  end
end
