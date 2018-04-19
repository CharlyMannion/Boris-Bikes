require 'bike'

describe Bike do
  it { is_expected.to respond_to :working }
  it { is_expected.to respond_to :report_broken }

  describe '#report_broken' do
    it "should allow the user to report a bike is broken" do
      subject.report_broken
      expect(subject.working).to eq false
    end

  end
end
