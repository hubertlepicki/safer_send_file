module SaferSendFile
  module Streaming 
    def safer_send_file(path, options = {})
      full_path = File.expand_path(path)
      if SaferSendFile.allowed_directories.any? { |dir| dir == full_path[0..dir.size-1] }
        send_file full_path, options
      else
        raise SaferSendFile::NotAllowed
      end
    end
  end
end


