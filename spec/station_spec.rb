require 'station'

describe Station do

  let(:subject) {described_class.new("",1)}

   it 'exposes a name' do
     expect(subject.name).to eq ""
   end

   it 'exposes a zone' do
     expect(subject.zone).to eq 1
   end

end
