require 'rails'
module SaferSendFile
  class Railtie < Rails::Railtie
    initializer "safer_send_file.include_helpers" do |app|
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send(:include, SaferSendFile::Streaming)
      end
    end
  end
end
