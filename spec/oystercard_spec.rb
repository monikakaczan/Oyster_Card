require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end

describe '#top_up' do

  it{ is_expected.to respond_to(:top_up).with(1).argument}
end
  it 'can top up the balance' do
    expect { subject.top_up 1 }.to change{subject.balance}.by 1
end
  it 'lets the customer top up up to £90' do
    max_balance = Oystercard::MAX_BALANCE
    subject.top_up max_balance #this line sets up a block - max is 90 and I can't go above that!
    expect {subject.top_up 1}.to raise_error "Maximum balance is exceeded!"
  end
end
