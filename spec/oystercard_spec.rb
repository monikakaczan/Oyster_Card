require 'oystercard'

describe Oystercard do
  it 'has a balance of zero'do
    # oystercard = Oystercard.new same as subject in line 6
    expect(subject.balance).to eq 0
    expect(subject.stations).to eq([])

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

    #describe '#deduct' do
    #  it{ is_expected.to respond_to(:deduct).with(1).argument}
    #end

    ####
   describe '#in_journey?' do
      it 'is initially not in journey' do
        expect(subject).not_to be_in_journey
      end

      describe "#touch_in" do
        it 'can check in' do
          station = Oystercard.new
          subject.top_up(5)
          subject.touch_in(station)
          expect(subject.in_journey).to be true
        end

        it 'marks the first station' do
        station = Oystercard.new
        subject.top_up 5
        subject.touch_in(station)
        expect(subject.stations).to eq([station])
      end
    end
       describe '#touch_in' do
         it 'customers cant start their journey if their balance is less than 1£' do
           station = Oystercard.new
           expect { subject.touch_in(station) }.to raise_error("Errrr, no money")
         end

       describe '#touch_out' do
         it{ is_expected.to respond_to(:touch_out).with(1).argument}
       end
     end
       it 'charges the right fare' do
         station = Oystercard.new
         station2 = Oystercard.new
         subject.top_up(5)
         subject.touch_in(station)
       expect { subject.touch_out(station2) }.to change{subject.balance}.by(-Oystercard::MIN_CHARGE)
     end
     it 'forgets the first staton' do
     station = Oystercard.new
     station2 = Oystercard.new
     subject.top_up(5)
     subject.touch_in(station)
     subject.touch_out(station2)
     expect(subject.stations).to eq([station, station2])
   end
 end
end
