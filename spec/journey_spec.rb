require './lib/journey'

describe Journey do
  let(:station) { double :station }
  subject(:complete_journey) { described_class.new(station, station)}

  it 'is an instance of' do
    expect(subject).to be_instance_of(Journey)
  end

  describe '#complete?' do

    it 'incomplete if entry station missing' do
      journey  = Journey.new(nil,station)
      expect(journey).not_to be_complete
    end


    it 'incomplete if exit station missing' do
      journey  =  Journey.new(station)
      expect(journey).not_to be_complete
    end


    it 'complete if neither station missing' do
      expect(complete_journey).to be_complete
    end

  end

  describe '#fare' do

    context 'journey complete' do
      
      it 'cost is minimum' do
        expect(complete_journey.fare).to eq 1
      end
    end
    
    context 'journey incomplete' do

      it 'cost is max' do
        journey  = Journey.new(station)
        expect(journey.fare).to eq 6
      end

    end
    

  end

end
