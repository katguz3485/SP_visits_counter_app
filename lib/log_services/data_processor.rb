# frozen_string_literal: true
require 'csv'
require 'pry'
require_relative '../../lib/log_services/data_reader'
require_relative '../../lib/log_services/data_parser'

class DataProcessor

  attr_reader :parsed_logs

  def initialize(parsed_logs:)
    @parsed_logs = parsed_logs
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
    parsed_logs.map(&:keys).uniq.flatten
  end

  def sort_visits(visits)
    visits.sort_by { |_k, v| v }.reverse.flatten
  end
end
