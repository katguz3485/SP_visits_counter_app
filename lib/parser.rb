# frozen_string_literal: true

require 'logger'
require_relative '../lib/log_services/data_processor'
require 'pp'

logger = Logger.new(STDOUT)

data_processor =  DataProcessor.new

logger.info('Data Processor initialized')

parsed_logs = data_processor.all_parsed_logs

unique_logs = data_processor.unique_logs

logger.info("The #{parsed_logs.count} of logs and #{unique_logs.count} of unique logs were found")

logger.info('All visits sorted')

pp data_processor.count_visits(logs_type: parsed_logs)

logger.info('Unique visits sorted')

pp data_processor.count_visits(logs_type: unique_logs)
