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

end