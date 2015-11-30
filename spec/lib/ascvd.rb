require 'spec_helper'

describe Ascvd do
  let(:set1) { Ascvd.new({ sex: 'M', race: 'WH', age: 40, cholesterol: 180, hdl: 50, systolic: 110, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }
  let(:set2) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 180, hdl: 50, systolic: 110, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }
  let(:set3) { Ascvd.new({ sex: 'M', race: 'WH', age: 59, cholesterol: 180, hdl: 50, systolic: 110, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }
  let(:options) { {} }


  describe 'age constraints' do
    context 'at age 19' do
      let(:options) { { age: 19 } }
      it 'does not calculate a lifetime risk' do
        expect(set1.lifetime_ascvd).to be_nil
      end
      it 'does not calculate a 10 year risk' do
        expect(set1.ten_year_ascvd).to be_nil
      end
    end
    context 'at age 20' do
      let(:options) { { age: 20 } }
      it 'calculates a lifetime risk' do
        expect(set1.lifetime_ascvd).not_to be_nil
      end
      it 'does not calculate a 10 year risk' do
        expect(set1.ten_year_ascvd).to be_nil
      end
    end
    context 'at age 39' do
      let(:options) { { age: 39 } }
      it 'calculates a lifetime risk' do
        expect(set1.lifetime_ascvd).not_to be_nil
      end
      it 'does not calculate a 10 year risk' do
        expect(set1.ten_year_ascvd).to be_nil
      end
    end
    context 'at age 40' do
      let(:options) { { age: 40 } }
      it 'calculates a lifetime risk' do
        expect(set1.lifetime_ascvd).not_to be_nil
      end
      it 'calculates a 10 year risk' do
        expect(set1.ten_year_ascvd).not_to be_nil
      end
    end
    context 'at age 59' do
      let(:options) { { age: 59 } }
      it 'calculates a lifetime risk' do
        expect(set1.lifetime_ascvd).not_to be_nil
      end
      it 'calculates a 10 year risk' do
        expect(set1.ten_year_ascvd).not_to be_nil
      end
    end
    context 'at age 60' do
      let(:options) { { age: 60 } }
      it 'does not calculate a lifetime risk' do
        expect(set1.lifetime_ascvd).to be_nil
      end
      it 'calculates a 10 year risk' do
        expect(set1.ten_year_ascvd).not_to be_nil
      end
    end
    context 'at age 79' do
      let(:options) { { age: 79 } }
      it 'does not calculate a lifetime risk' do
        expect(set1.lifetime_ascvd).to be_nil
      end
      it 'calculates a 10 year risk' do
        expect(set1.ten_year_ascvd).not_to be_nil
      end
    end
    context 'at age 80' do
      let(:options) { { age: 80 } }
      it 'does not calculate a lifetime risk' do
        expect(set1.lifetime_ascvd).to be_nil
      end
      it 'does not calculate a 10 year risk' do
        expect(set1.ten_year_ascvd).to be_nil
      end
    end
  end


  describe 'results' do
    context "female" do

      context 'white/other' do
        let(:options) { { sex: 'F', race: 'WH' } }

        it 'set1' do
          expect(set1.lifetime_ascvd).to eq(0.27)
          expect(set1.ten_year_ascvd).to be_within(0.000001).of(0.004170)
        end
        it 'set2' do
          expect(set2.lifetime_ascvd).to eq(0.27)
          expect(set2.ten_year_ascvd).to be_within(0.000001).of(0.009028)
        end
        it 'set3' do
          expect(set3.lifetime_ascvd).to eq(0.27)
          expect(set3.ten_year_ascvd).to be_within(0.000001).of(0.021817)
        end
      end

      context 'african american' do
        let(:options) { { sex: 'F', race: 'AA' } }

        it 'set1' do
          expect(set1.lifetime_ascvd).to eq(0.27)
          expect(set1.ten_year_ascvd).to be_within(0.000001).of(0.002844)
        end
        it 'set2' do
          expect(set2.lifetime_ascvd).to eq(0.27)
          expect(set2.ten_year_ascvd).to be_within(0.000001).of(0.010822)
        end
        it 'set3' do
          expect(set3.lifetime_ascvd).to eq(0.27)
          expect(set3.ten_year_ascvd).to be_within(0.000001).of(0.028977)
        end
      end
    end

    context "male" do

      context 'white/other' do
        let(:options) { { sex: 'M', race: 'WH' } }

        it 'set1' do
          expect(set1.lifetime_ascvd).to eq(0.36)
          expect(set1.ten_year_ascvd).to be_within(0.000001).of(0.006876)
        end
        it 'set2' do
          expect(set2.lifetime_ascvd).to eq(0.36)
          expect(set2.ten_year_ascvd).to be_within(0.000001).of(0.022912)
        end
        it 'set3' do
          expect(set3.lifetime_ascvd).to eq(0.36)
          expect(set3.ten_year_ascvd).to be_within(0.000001).of(0.055352)
        end
      end

      context 'african american' do
        let(:options) { { sex: 'M', race: 'AA' } }

        it 'set1' do
          expect(set1.lifetime_ascvd).to eq(0.36)
          expect(set1.ten_year_ascvd).to be_within(0.000001).of(0.022863)
        end
        it 'set2' do
          expect(set2.lifetime_ascvd).to eq(0.36)
          expect(set2.ten_year_ascvd).to be_within(0.000001).of(0.039331)
        end
        it 'set3' do
          expect(set3.lifetime_ascvd).to eq(0.36)
          expect(set3.ten_year_ascvd).to be_within(0.000001).of(0.058594)
        end
      end


    end
  end
end
