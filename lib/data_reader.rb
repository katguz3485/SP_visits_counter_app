# frozen_string_literal: true

require 'csv'

class DataReader
  attr_reader :logs

  def initialize
    @logs = logs
  end

  def logs
    readed_logs(path)
  end

  private

  def path
    '/home/kasia/Desktop/visits_counter_app/lib/webserver.log.csv'
  end

  def readed_logs(path)
    logs = []
    CSV.foreach(path) do |row|
      logs << row
    end
    logs
  end
end

dr = DataReader.new
puts dr.logs
