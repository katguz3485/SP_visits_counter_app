require 'csv'
require 'pry'

class Parser

  attr_reader :logs

  def initialize
    @logs = parsed_logs
  end

  private

  def parsed_logs
    @logs = []
    CSV.foreach('/home/kasia/Desktop/project/SP_visits_counter_app/lib/webserver.log.csv') do |row|
      @logs << parse_row(row)
    end
    @logs
  end

  def parse_row(row)
    row.map {|addres_ip_pair| addres_ip_pair.split(" ")}.to_h
  end
end


# p = Parser.new
# puts p.logs.map { |x| x.keys }