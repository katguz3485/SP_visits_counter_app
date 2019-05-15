# frozen_string_literal: true

require 'csv'
require 'pry'
require_relative '../../lib/log_services/data_reader'
require_relative '../../lib/log_services/data_parser'

class DataProcessor
  attr_reader :all_parsed_logs, :unique_logs

  def initialize
    @logs = DataReader.new.logs
    @all_parsed_logs = DataParser.new(logs: @logs).parsed_logs
    @unique_logs = all_parsed_logs.uniq
  end

  def count_visits(logs_type:, unique_uri_keys: find_unique_uris)
    visits = {}
    unique_uri_keys.each do |uri|
      size = logs_type.map { |uri_ip_pair| uri_ip_pair[uri] }.compact.length
      visits.store(uri, size)
    end
    sort_visits(visits)
  end

  private

  def find_unique_uris
    all_parsed_logs.map(&:keys).uniq.flatten
  end

  def sort_visits(visits)
    visits.sort_by { |_k, v| v }.reverse.flatten
  end
end
