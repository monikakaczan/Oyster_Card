require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    # oystercard = Oystercard.new same as subject in line 6
    expect(subject.balance).to eq 0
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

    describe '#deduct' do
      it{ is_expected.to respond_to(:deduct).with(1).argument}
    end

    ####
   describe '#in_journey?'do
      it 'is initially not in journey' do
        expect(subject).not_to be_in_journey
      end
    end
      describe "#touch_in" do
        it 'can check in' do
          subject.top_up(5)
          expect(subject.touch_in).to be true
        end
      end
       describe '#touch_in' do
         it 'allows the customer to start the journey if minimal amount is £1' do
           expect { subject.touch_in }.to raise_error("Errrr, no money")
         end
   end
end
