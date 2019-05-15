
require 'csv'

class DataReader
  class FileNotFound < StandardError;
  end

  attr_reader :logs

  def initialize
    @logs = logs
  end

  def logs
    validate_presence_of_file(path)
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

  def validate_presence_of_file(path)
    raise FileNotFound unless File.file?(path)
  end

end

# dr = DataReader.new
# puts dr.logs
