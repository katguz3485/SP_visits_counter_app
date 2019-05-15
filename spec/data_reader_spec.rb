require_relative '../lib/data_reader'

RSpec.describe DataReader do
  let!(:data_reader) {DataReader.new}
  let!(:readed_logs) {data_reader.logs}
  let!(:example_log) {readed_logs.sample}
  let!(:fake_log) {["/fake_page 836.973.694.403"]}


  describe ".logs" do
    it "should contain example log from file" do
      expect(readed_logs).to include(example_log)
    end

    it 'should not contain fake data' do
      expect(readed_logs).to_not include(fake_log)
    end
  end

end