module SaferSendFile
  class NotAllowed < RuntimeError; end
  def self.allowed_directories=(some_directories)
    @@allowed_directories = some_directories.collect { |dir| File.expand_path(dir) }
  end

  def self.allowed_directories
    defined?(@@allowed_directories) ? @@allowed_directories : []
  end
end

require 'safer_send_file/streaming'
require 'safer_send_file/railtie'
