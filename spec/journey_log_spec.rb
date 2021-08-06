require 'journey_log'

describe JourneyLog do
  let(:station) { double :station }
  let(:journey) { double :journey }
  


  describe "#start" do
  
    it 'starts a journey' do
      allow(journey).to receive_messages(entry_station: station)
      expect(subject.start(station)).to eq journey
    end
  
  end

  describe "#finish" do

    it '' do
      
    end

  
  end

  describe "#journeys" do
    
    it '' do
      
    end
  
  end


end