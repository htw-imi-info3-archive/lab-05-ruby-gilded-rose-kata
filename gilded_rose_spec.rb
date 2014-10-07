
require 'simplecov'
SimpleCov.start

require 'gilded_rose'

describe "#update_quality" do

    before(:each) do
      @initial_sell_in = 5
      @initial_quality = 10
    end

    let(:item) { Item.new(name, @initial_sell_in, @initial_quality) }

    after(:each) do
      expect(item.sell_in).to eq(@initial_sell_in-1)
    end

  context "with a single" do
    context "normal item" do
      let(:name) { "NORMAL ITEM" }

      it "before sell date" do
        update_quality([item])
        expect(item.quality).to eq(@initial_quality-1)
      end

      it "after sell date" do
        @initial_sell_in = -10
        update_quality([item])
        expect(item.quality).to eq(@initial_quality-2)
      end
    end

    context "conjured item" do
          
      before { pending "you need to implement the properties for a conjured item" }
      let(:name) { "Conjured Mana Cake" }

      it "before the sell date" do
        @initial_sell_in = 5
        update_quality([item])
        expect(item.quality).to eq(@initial_quality-2)
      end
      it "at zero quality" do
        @initial_quality = 0 
        update_quality([item])
        expect(item.quality).to eq(@initial_quality) 
      end
    end
  end
end
