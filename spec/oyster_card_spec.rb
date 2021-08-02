require 'oyster_card'

describe Oystercard do

  it "has a balance of 0" do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do

   it 'responds to top_up' do
    expect(subject).to respond_to(:top_up).with(1).argument
   end
   
   it 'tops up an oyster card' do
     expect(subject.top_up(5)).to eq 5
   end

   it 'returns an error if top-up amount exceeds max amount' do
    expect { subject.top_up(91) }.to raise_error "Max amount exceeded"
   end

   it 'returns and error if the new balance exceeds max amount' do
    expect { 10.times { subject.top_up(10) } }.to raise_error "Max amount exceeded"
   end

  end

  describe '#deduct' do

    it 'responds to deduct' do
      expect(subject).to respond_to(:deduct).with(1).argument
     end
     
    it 'tops up an oyster card' do
      subject.top_up(5)
      expect(subject.deduct(5)).to eq 0
     end
  end

  describe '#in_journey?' do
    
    it 'a new card is out of use' do
      expect(subject).not_to be_in_journey
    end

    context 'after touching in' do

      it 'it is in use' do
        subject.touch_in
        expect(subject).to be_in_journey
      end
    
    end

    context 'after touching out' do

      it 'it out of use' do
        subject.touch_in
        subject.touch_out
        expect(subject).not_to be_in_journey
      end

    end

  end

end
