require 'rails_helper'

RSpec.describe SendFile do
  describe '#publish_file' do
    let(:file) do
      file = Tempfile.new('test file')
      file << 'lol'
      file.close
      file.path
    end
    subject { SendFile.send_file(file) }

    it 'preserves the orignal file name' do
      expect(File.basename(URI.decode(subject))).to eq(File.basename(file))
    end

    it 'copies the file' do
      public_file = File.join(Rails.public_path, URI.decode(subject))
      expect(FileUtils.compare_file(public_file, file)).to be_truthy
    end

    context 'when a custom name is given' do
      let(:file_name) { 'Name with whitespaces' }
      subject { SendFile.send_file(file, file_name) }

      it 'uses the custom name' do
        expect(File.basename(URI.decode(subject))).to eq(file_name)
      end
    end
  end
end
