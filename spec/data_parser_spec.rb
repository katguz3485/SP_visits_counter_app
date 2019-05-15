# frozen_string_literal: true

require_relative '../lib/data_parser'

RSpec.describe DataParser do
  let!(:logs) { DataReader.new.logs }
  let!(:data_parser) { DataParser.new(logs: logs) }
  let!(:parsed_logs) { data_parser.parsed_logs }
  let!(:example_log) { parsed_logs.sample }
  let!(:fake_log) { ['/fake_page => 836.973.694.403'] }

  describe '.parsed_logs' do
    it 'should contain example log from file' do
      expect(parsed_logs).to include(example_log)
    end

    it 'should not contain fake data' do
      expect(parsed_logs).to_not include(fake_log)
    end
  end
end
