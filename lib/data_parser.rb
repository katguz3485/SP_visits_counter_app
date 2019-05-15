# frozen_string_literal: true

require_relative '../lib/data_reader'

class DataParser
  attr_reader :logs

  def initialize(logs:)
    @logs = logs
  end

  def parsed_logs
    parse_to_hash
  end

  private

  def parse_to_hash
    logs.map { |row| parse_row(row) }
  end

  def parse_row(row)
    row.map { |x| x.split(' ') }.to_h
  end
end

# dp = DataParser.new(logs: DataReader.new.logs)
# puts dp
# puts dp.parsed_logs
