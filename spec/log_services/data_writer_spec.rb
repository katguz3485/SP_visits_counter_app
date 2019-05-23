# frozen_string_literal: true

require_relative '../../lib/log_services/data_reader'
require_relative '../../lib/log_services/data_writer'

RSpec.describe DataWriter do
  let(:logs) { DataReader.new.logs }
  let(:data_writer) { DataWriter.new(logs: logs).write_data }

  describe '.write_data' do
    it 'should contain data from file' do
      expect(CSV.open(data_writer.path).readlines).to eq(logs)
      File.delete(data_writer.path)
    end
  end
end