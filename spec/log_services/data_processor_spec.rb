# frozen_string_literal: true

require_relative '../../lib/log_services/data_reader'
require_relative '../../lib/log_services/data_parser'
require_relative '../../lib/log_services/data_processor'

RSpec.describe DataProcessor do
  let(:logs) { DataReader.new.logs }
  let(:all_parsed_logs) { DataParser.new(logs: logs).parsed_logs }
  let(:unique_logs) { all_parsed_logs.uniq }
  let(:data_processor) { DataProcessor.new }
  let(:unique_visits) { ['/index', 23, '/home', 23, '/contact', 23, '/help_page/1', 23, '/about/2', 22, '/about', 21] }
  let(:all_visits) { ['/about/2', 90, '/contact', 89, '/index', 82, '/about', 81, '/help_page/1', 80, '/home', 78] }
  let(:unique_uris) { all_parsed_logs.map(&:keys).uniq.flatten }

  context 'when_logs_are_not_unique' do
    describe '.count_visits' do
      it 'should retrieve sorted list of all logs' do
        expect(data_processor.count_visits(logs_type: all_parsed_logs)).to eq(all_visits)
      end
    end
  end

  context 'when_logs_are_unique' do
    describe '.count_visits' do
      it 'should retrieve sorted list of unique logs' do
        expect(data_processor.count_visits(logs_type: unique_logs)).to eq(unique_visits)
      end
    end
  end
end
