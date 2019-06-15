# frozen_string_literal: true

require 'logger'
require_relative '../lib/log_services/data_processor'
require 'pp'
require 'pry'

logger = Logger.new(STDOUT)

# p_logs = DataParser.new(logs: DataReader.new.logs).parsed_logs

data_processor = DataProcessor.new

parsed_logs = data_processor.parsed_logs

logger.info('Data Processor initialized')

unique_logs = data_processor.parsed_logs.uniq

case ARGV[0]
when '-all'
  logger.info('All visits sorted')
  puts data_processor.count_visits(logs_type: parsed_logs)

when '-uniq'
  logger.info('Unique visits sorted')
  puts data_processor.count_visits(logs_type: unique_logs)
end
