require 'spec_helper'
require_relative '../lib/gilded_rose'

RSpec.describe GildedRose do
  subject(:gilded_rose) do
    GildedRose.new(name: name, days_remaining: days_remaining, quality: quality)
  end


  context 'Backstage passes to a TAFKAL80ETC concert' do
    let(:name) { 'Backstage passes to a TAFKAL80ETC concert' }

    context 'with 11 days to sell date' do
      let(:days_remaining) { 11 }

      context 'with moderate quality' do
        let(:quality) { 10 }

        it 'should have one less day remaining' do
          expect { gilded_rose.tick }.to change { gilded_rose.days_remaining }
            .from(11).to(10)
        end

        it 'should improve in quality by 1' do
          expect { gilded_rose.tick }.to change { gilded_rose.quality }
            .from(10).to(11)
        end
      end


    end

    context 'with 10 days to sell date' do
      let(:days_remaining) { 10 }

      context 'with moderate quality' do
        let(:quality) { 10 }

        it 'should have one less day remaining' do
          expect { gilded_rose.tick }.to change { gilded_rose.days_remaining }
            .from(10).to(9)
        end

        it 'should improve in quality by 2' do
          expect { gilded_rose.tick }.to change { gilded_rose.quality }
            .from(10).to(12)
        end
      end

      context 'with max quality' do
        let(:quality) { 50 }

        it 'should have one less day remaining' do
          expect { gilded_rose.tick }.to change { gilded_rose.days_remaining }
            .from(10).to(9)
        end

        it 'should remain at max quality' do
          expect { gilded_rose.tick }.to_not change { gilded_rose.quality }
        end
      end
    end

    context 'with 6 days to sell date' do
      let(:days_remaining) { 6 }

      context 'with moderate quality' do
        let(:quality) { 10 }

        it 'should have one less day remaining' do
          expect { gilded_rose.tick }.to change { gilded_rose.days_remaining }
            .from(6).to(5)
        end

        it 'should improve in quality by 2' do
          expect { gilded_rose.tick }.to change { gilded_rose.quality }
            .from(10).to(12)
        end
      end

      context 'with max quality' do
        let(:quality) { 50 }

        it 'should have one less day remaining' do
          expect { gilded_rose.tick }.to change { gilded_rose.days_remaining }
            .from(6).to(5)
        end

        it 'should remain at max quality' do
          expect { gilded_rose.tick }.to_not change { gilded_rose.quality }
        end
      end
    end

    context 'with 5 days to sell date' do
      let(:days_remaining) { 5 }

      context 'with moderate quality' do
        let(:quality) { 10 }

        it 'should have one less day remaining' do
          expect { gilded_rose.tick }.to change { gilded_rose.days_remaining }
            .from(5).to(4)
        end

        it 'should improve in quality by 3' do
          expect { gilded_rose.tick }.to change { gilded_rose.quality }
            .from(10).to(13)
        end
      end

      context 'with max quality' do
        let(:quality) { 50 }

        it 'should have one less day remaining' do
          expect { gilded_rose.tick }.to change { gilded_rose.days_remaining }
            .from(5).to(4)
        end

        it 'should remain at max quality' do
          expect { gilded_rose.tick }.to_not change { gilded_rose.quality }
        end
      end
    end

    context 'with 1 day to sell date' do
      let(:days_remaining) { 1 }

      context 'with moderate quality' do
        let(:quality) { 10 }

        it 'should have one less day remaining' do
          expect { gilded_rose.tick }.to change { gilded_rose.days_remaining }
            .from(1).to(0)
        end

        it 'should improve in quality by 3' do
          expect { gilded_rose.tick }.to change { gilded_rose.quality }
            .from(10).to(13)
        end
      end

      context 'with max quality' do
        let(:quality) { 50 }

        it 'should have one less day remaining' do
          expect { gilded_rose.tick }.to change { gilded_rose.days_remaining }
            .from(1).to(0)
        end

        it 'should remain at max quality' do
          expect { gilded_rose.tick }.to_not change { gilded_rose.quality }
        end
      end
    end

    context 'on sell date' do
      let(:days_remaining) { 0 }
      let(:quality) { 10 }

      it 'should have one less day remaining' do
        expect { gilded_rose.tick }.to change { gilded_rose.days_remaining }
          .from(0).to(-1)
      end

      it 'should have no quality' do
        expect { gilded_rose.tick }.to change { gilded_rose.quality }
          .from(10).to(0)
      end
    end

    context 'after sell date' do
      let(:days_remaining) { -10 }
      let(:quality) { 10 }

      it 'should have one less day remaining' do
        expect { gilded_rose.tick }.to change { gilded_rose.days_remaining }
          .from(-10).to(-11)
      end

      it 'should have no quality' do
        expect { gilded_rose.tick }.to change { gilded_rose.quality }
          .from(10).to(0)
      end
    end
  end


end
