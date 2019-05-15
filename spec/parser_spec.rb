require_relative '../lib/parser'

RSpec.describe Parser do
  let!(:parser) {Parser.new}
  let!(:parsed_logs) {parser.logs}
  let!(:unique_logs) {parser.logs.uniq}
  let!(:unique_visits) {["/index", 23, "/home", 23, "/contact", 23, "/help_page/1", 23, "/about/2", 22, "/about", 21]}
  let!(:all_visits) {["/about/2", 90, "/contact", 89, "/index", 82, "/about", 81, "/help_page/1", 80, "/home", 78]}

  describe '.parsed_logs' do
    it 'should load logs from csv as an array of hashes' do
      expect(parser.logs).to eq(parsed_logs)
    end
  end

  context 'when_logs_are_not_unique' do
    describe '.count_visits' do
      it 'should retrieve sorted list of all logs' do
        expect(parser.count_visits(logs: parsed_logs)).to eq(all_visits)
      end
    end
  end

  context 'when_logs_are_unique' do
    describe '.count_visits' do
      it 'should retrieve sorted list of unique logs' do
        expect(parser.count_visits(logs: unique_logs)).to eq(unique_visits)
      end
    end
  end

# this_tests_are_optional_and_written_to_practice_but_encapsulation_rule_is_broken_here

  describe '.parse_row' do

    it 'should parse single row to hash format' do
      parsed_row = {"/help_page/1" => "126.318.035.038"}
      row = ["/help_page/1 126.318.035.038"]
      expect(parser.send(:parse_row, row)).to eq(parsed_row)
    end
  end

  describe '.find_unique_uris' do
    it 'should find unique uris' do
      unique_keys = parsed_logs.map {|row| row.keys}.uniq.flatten
      expect(parser.send(:find_unique_uris)).to eq(unique_keys)
    end
  end

  describe '.sort_visits' do
    it 'should sort visits descending' do
      expect(parser.send(:sort_visits, unique_visits.reverse)).to eq(unique_visits)
    end
  end

end

