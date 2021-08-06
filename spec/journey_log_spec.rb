require 'journey'
require 'journey_log'

describe JourneyLog do
  subject(:journey_log) { described_class.new(journey_class: Journey) }
  let(:station) { double :station }
  let(:journey) { double :journey }

  describe "#start" do
  
    it 'starts a journey' do
      expect(journey_log.start(station)).to be_an_instance_of(Journey)
    end

  end

  describe "#finish" do

    it 'completes a journey' do
      journey_log.start(station)
      expect { journey_log.finish(station) }.to change { journey_log.journeys.count }.by(1)
    end

  
  end

end