# frozen_string_literal: true

require 'csv'
require_relative '../../lib/log_services/data_reader'

class DataWriter
  attr_reader :logs

  def initialize(logs:)
    @logs = logs
  end

  def write_data
    write_to_path(path)
  end

  def path
    File.expand_path(File.dirname(File.dirname(__FILE__))) + '/output_file.csv'
  end

  private

  def write_to_path(path)
    CSV.open(path, 'wb', col_sep: "\n") do |csv|
      csv << logs.map { |row| row.join('') }
    end
  end
end