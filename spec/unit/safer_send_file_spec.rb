require 'spec_helper'

class MyClass
  include SaferSendFile
  def perform_send(path)
    safer_send_file(path)
  end
end

describe "#safer_send_file" do
  before :each do
    @instance = MyClass.new
    SaferSendFile.allowed_directories = [File.join(File.dirname(__FILE__), "..", "lib")]
  end

  it "should send files from configured directories without problems" do
    @instance.should_receive(:send_file).with(File.expand_path(File.join(File.dirname(__FILE__), "..", "lib", "safer_send_file.rb")), {})
    @instance.perform_send(File.join(File.dirname(__FILE__), "..", "lib", "safer_send_file.rb"))
  end

  it "should not send files from outside configured directories" do
    @instance.should_not_receive(:send_file)
    ["/etc/passwd", "../spec/spec_helper.rb", __FILE__].each do |file|
      lambda {
        @instance.perform_send file
      }.should raise_error(SaferSendFile::NotAllowed)
    end
  end
end
