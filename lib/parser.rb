require 'csv'
require 'pry'

class Parser

  attr_reader :logs

  def initialize
    @logs = parsed_logs
  end

  def count_visits(logs:, unique_uri_keys: find_unique_uris)
    visits = {}
    unique_uri_keys.each do |uri|
      size = logs.map {|uri_ip_pair| uri_ip_pair[uri]}.compact.length
      visits.store(uri, size)
    end
    sort_visits(visits)
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

  def find_unique_uris
    @logs.map {|addres_ip_pair| addres_ip_pair.keys}.uniq.flatten
  end

  def sort_visits(visits)
    # visits.sort_by(&:last).reverse.flatten
    visits.sort_by { |_k, v| v }.reverse.flatten
  end

end

p = Parser.new
puts p.count_visits(logs: p.logs)
puts p.count_visits(logs: p.logs.uniq)
