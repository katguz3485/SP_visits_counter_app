# frozen_string_literal: true

require 'csv'
require_relative '../errors/error_handler'
require 'pry'

class DataReader
  include ErrorHandler

  attr_reader :logs

  def initialize
    @logs = logs
  end

  def logs
    ErrorHandler::FileNotFound.validate_presence_of_file(path)
    # ErrorHandler::FileNotFound: It seems that path to file is wrong
    readed_logs(path)
  end

  private

  def path
    File.expand_path(File.dirname(File.dirname(__FILE__))) + '/webserver.log.csv'
  end

  def readed_logs(path)
    logs = []
    CSV.foreach(path) do |row|
      logs << row
    end
    logs
  end
end

