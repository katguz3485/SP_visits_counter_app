# frozen_string_literal: true

require_relative '../../lib/errors/error_handler'

RSpec.describe ErrorHandler do
  let(:not_existing_path) { 'some_fake_path/webserver.log.csv' }
  let(:error_message) { 'It seems that path to file is wrong' }

  context 'when path to the file does not exist' do
    it 'should raise File not Found StandardError' do
      expect { ErrorHandler::FileNotFound.validate_presence_of_file(not_existing_path) }.to raise_error(StandardError, error_message)
    end
  end
end
