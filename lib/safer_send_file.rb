module SaferSendFile
  class NotAllowed < RuntimeError; end

  def safer_send_file(path, options = {})
    full_path = File.expand_path(path)
    if SaferSendFile.allowed_directories.any? { |dir| dir == full_path[0..dir.size-1] }
      send_file full_path, options
    else
      raise SaferSendFile::NotAllowed
    end
  end

  def self.allowed_directories=(some_directories)
    @@allowed_directories = some_directories.collect { |dir| File.expand_path(dir) }
  end

  def self.allowed_directories
    defined?(@@allowed_directories) ? @@allowed_directories : []
  end
end
