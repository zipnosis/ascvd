require 'spec_helper'

describe Ascvd do
  let(:options) { {} }
  let(:set1) { Ascvd.new({ sex: 'M', race: 'WH', age: 40, cholesterol: 170, hdl: 50, systolic: 110, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }
  let(:set2) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 170, hdl: 50, systolic: 110, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }
  let(:set3) { Ascvd.new({ sex: 'M', race: 'WH', age: 59, cholesterol: 170, hdl: 50, systolic: 110, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }

  let(:set4) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 180, hdl: 50, systolic: 110, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }
  let(:set5) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 200, hdl: 50, systolic: 110, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }
  let(:set6) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 240, hdl: 50, systolic: 110, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }

  let(:set7) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 170, hdl: 50, systolic: 120, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }
  let(:set8) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 170, hdl: 50, systolic: 140, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }
  let(:set9) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 170, hdl: 50, systolic: 160, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }

  let(:set10) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 170, hdl: 50, systolic: 110, bptreatment: true, diabetes: false, smoker: false }.merge(options)) }
  let(:set11) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 170, hdl: 50, systolic: 110, bptreatment: false, diabetes: true, smoker: false }.merge(options)) }
  let(:set12) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 170, hdl: 50, systolic: 110, bptreatment: false, diabetes: false, smoker: true }.merge(options)) }

  let(:set13) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 180, hdl: 50, systolic: 120, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }
  let(:set14) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 200, hdl: 50, systolic: 140, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }
  let(:set15) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 240, hdl: 50, systolic: 160, bptreatment: false, diabetes: false, smoker: false }.merge(options)) }

  let(:set16) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 200, hdl: 50, systolic: 160, bptreatment: true, diabetes: false, smoker: false }.merge(options)) }
  let(:set17) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 200, hdl: 50, systolic: 160, bptreatment: true, diabetes: true, smoker: false }.merge(options)) }
  let(:set18) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 200, hdl: 50, systolic: 160, bptreatment: true, diabetes: true, smoker: true }.merge(options)) }

  let(:set19) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 180, hdl: 30, systolic: 120, bptreatment: true, diabetes: false, smoker: true }.merge(options)) }
  let(:set20) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 180, hdl: 40, systolic: 125, bptreatment: false, diabetes: true, smoker: true }.merge(options)) }
  let(:set21) { Ascvd.new({ sex: 'M', race: 'WH', age: 50, cholesterol: 180, hdl: 70, systolic: 130, bptreatment: true, diabetes: true, smoker: false }.merge(options)) }


  describe 'age constraints' do
    context 'at age 19' do
      let(:options) { { age: 19 } }
      it 'does not calculate a lifetime risk' do
        expect(set1.lifetime_ascvd).to eq 'n/a'
      end
      it 'does not calculate a 10 year risk' do
        expect(set1.ten_year_ascvd).to eq 'n/a'
      end
    end
    context 'at age 20' do
      let(:options) { { age: 20 } }
      it 'calculates a lifetime risk' do
        expect(set1.lifetime_ascvd).not_to eq 'n/a'
      end
      it 'does not calculate a 10 year risk' do
        expect(set1.ten_year_ascvd).to eq 'n/a'
      end
    end
    context 'at age 39' do
      let(:options) { { age: 39 } }
      it 'calculates a lifetime risk' do
        expect(set1.lifetime_ascvd).not_to eq 'n/a'
      end
      it 'does not calculate a 10 year risk' do
        expect(set1.ten_year_ascvd).to eq 'n/a'
      end
    end
    context 'at age 40' do
      let(:options) { { age: 40 } }
      it 'calculates a lifetime risk' do
        expect(set1.lifetime_ascvd).not_to eq 'n/a'
      end
      it 'calculates a 10 year risk' do
        expect(set1.ten_year_ascvd).not_to eq 'n/a'
      end
    end
    context 'at age 59' do
      let(:options) { { age: 59 } }
      it 'calculates a lifetime risk' do
        expect(set1.lifetime_ascvd).not_to eq 'n/a'
      end
      it 'calculates a 10 year risk' do
        expect(set1.ten_year_ascvd).not_to eq 'n/a'
      end
    end
    context 'at age 60' do
      let(:options) { { age: 60 } }
      it 'does not calculate a lifetime risk' do
        expect(set1.lifetime_ascvd).to eq 'n/a'
      end
      it 'calculates a 10 year risk' do
        expect(set1.ten_year_ascvd).not_to eq 'n/a'
      end
    end
    context 'at age 79' do
      let(:options) { { age: 79 } }
      it 'does not calculate a lifetime risk' do
        expect(set1.lifetime_ascvd).to eq 'n/a'
      end
      it 'calculates a 10 year risk' do
        expect(set1.ten_year_ascvd).not_to eq 'n/a'
      end
    end
    context 'at age 80' do
      let(:options) { { age: 80 } }
      it 'does not calculate a lifetime risk' do
        expect(set1.lifetime_ascvd).to eq 'n/a'
      end
      it 'does not calculate a 10 year risk' do
        expect(set1.ten_year_ascvd).to eq 'n/a'
      end
    end
  end


  describe '#errors' do
    let(:options)  { { sex: 'X', age: 200 } }
    it 'returns an array of errors' do
      expect(set1.errors.length).to eq(2)
    end
  end

  describe '#valid' do
    context 'valid params' do
      it 'returns true' do
        expect(set1).to be_valid
      end
    end
    context 'invalid params' do
      let(:options) { { sex: 'X' } }
      it 'returns false' do
        expect(set1).not_to be_valid
      end
    end
  end

  describe 'results' do
    context "female" do

      context 'white/other' do
        let(:options) { { sex: 'F', race: 'WH' } }

        it 'set1' do
          expect(set1.lifetime_ascvd).to eq(0.08)
          expect(set1.ten_year_ascvd).to be_within(0.000001).of(0.003709)
        end
        it 'set2' do
          expect(set2.lifetime_ascvd).to eq(0.08)
          expect(set2.ten_year_ascvd).to be_within(0.000001).of(0.008356)
        end
        it 'set3' do
          expect(set3.lifetime_ascvd).to eq(0.08)
          expect(set3.ten_year_ascvd).to be_within(0.000001).of(0.020802)
        end
        it 'set4' do
          expect(set4.lifetime_ascvd).to eq(0.27)
          expect(set4.ten_year_ascvd).to be_within(0.000001).of(0.009028)
        end
        it 'set5' do
          expect(set5.lifetime_ascvd).to eq(0.39)
          expect(set5.ten_year_ascvd).to be_within(0.000001).of(0.010409)
        end
        it 'set6' do
          expect(set6.lifetime_ascvd).to eq(0.39)
          expect(set6.ten_year_ascvd).to be_within(0.000001).of(0.013314)
        end
        it 'set7' do
          expect(set7.lifetime_ascvd).to eq(0.27)
          expect(set7.ten_year_ascvd).to be_within(0.000001).of(0.009900)
        end
        it 'set8' do
          expect(set8.lifetime_ascvd).to eq(0.39)
          expect(set8.ten_year_ascvd).to be_within(0.000001).of(0.013363)
        end
        it 'set9' do
          expect(set9.lifetime_ascvd).to eq(0.39)
          expect(set9.ten_year_ascvd).to be_within(0.000001).of(0.017319)
        end
        it 'set10' do
          expect(set10.lifetime_ascvd).to eq(0.39)
          expect(set10.ten_year_ascvd).to be_within(0.000001).of(0.011168)
        end
        it 'set11' do
          expect(set11.lifetime_ascvd).to eq(0.39)
          expect(set11.ten_year_ascvd).to be_within(0.000001).of(0.016121)
        end
        it 'set12' do
          expect(set12.lifetime_ascvd).to eq(0.39)
          expect(set12.ten_year_ascvd).to be_within(0.000001).of(0.023942)
        end
        it 'set13' do
          expect(set13.lifetime_ascvd).to eq(0.27)
          expect(set13.ten_year_ascvd).to be_within(0.000001).of(0.010695)
        end
        it 'set14' do
          expect(set14.lifetime_ascvd).to eq(0.39)
          expect(set14.ten_year_ascvd).to be_within(0.000001).of(0.016635)
        end
        it 'set15' do
          expect(set15.lifetime_ascvd).to eq(0.50)
          expect(set15.ten_year_ascvd).to be_within(0.000001).of(0.027519)
        end
        it 'set16' do
          expect(set16.lifetime_ascvd).to eq(0.50)
          expect(set16.ten_year_ascvd).to be_within(0.000001).of(0.029400)
        end
        it 'set17' do
          expect(set17.lifetime_ascvd).to eq(0.50)
          expect(set17.ten_year_ascvd).to be_within(0.000001).of(0.056156)
        end
        it 'set18' do
          expect(set18.lifetime_ascvd).to eq(0.50)
          expect(set18.ten_year_ascvd).to be_within(0.000001).of(0.153714)
        end
        it 'set19' do
          expect(set19.lifetime_ascvd).to eq(0.50)
          expect(set19.ten_year_ascvd).to be_within(0.000001).of(0.076412)
        end
        it 'set20' do
          expect(set20.lifetime_ascvd).to eq(0.50)
          expect(set20.ten_year_ascvd).to be_within(0.000001).of(0.082654)
        end
        it 'set21' do
          expect(set21.lifetime_ascvd).to eq(0.50)
          expect(set21.ten_year_ascvd).to be_within(0.000001).of(0.021332)
        end
      end

      context 'african american' do
        let(:options) { { sex: 'F', race: 'AA' } }

        it 'set1' do
          expect(set1.lifetime_ascvd).to eq(0.08)
          expect(set1.ten_year_ascvd).to be_within(0.000001).of(0.002695)
        end
        it 'set2' do
          expect(set2.lifetime_ascvd).to eq(0.08)
          expect(set2.ten_year_ascvd).to be_within(0.000001).of(0.010259)
        end
        it 'set3' do
          expect(set3.lifetime_ascvd).to eq(0.08)
          expect(set3.ten_year_ascvd).to be_within(0.000001).of(0.027483)
        end
        it 'set4' do
          expect(set4.lifetime_ascvd).to eq(0.27)
          expect(set4.ten_year_ascvd).to be_within(0.000001).of(0.010822)
        end
        it 'set5' do
          expect(set5.lifetime_ascvd).to eq(0.39)
          expect(set5.ten_year_ascvd).to be_within(0.000001).of(0.011941)
        end
        it 'set6' do
          expect(set6.lifetime_ascvd).to eq(0.39)
          expect(set6.ten_year_ascvd).to be_within(0.000001).of(0.014157)
        end
        it 'set7' do
          expect(set7.lifetime_ascvd).to eq(0.27)
          expect(set7.ten_year_ascvd).to be_within(0.000001).of(0.014506)
        end
        it 'set8' do
          expect(set8.lifetime_ascvd).to eq(0.39)
          expect(set8.ten_year_ascvd).to be_within(0.000001).of(0.026733)
        end
        it 'set9' do
          expect(set9.lifetime_ascvd).to eq(0.39)
          expect(set9.ten_year_ascvd).to be_within(0.000001).of(0.045210)
        end
        it 'set10' do
          expect(set10.lifetime_ascvd).to eq(0.39)
          expect(set10.ten_year_ascvd).to be_within(0.000001).of(0.018143)
        end
        it 'set11' do
          expect(set11.lifetime_ascvd).to eq(0.39)
          expect(set11.ten_year_ascvd).to be_within(0.000001).of(0.024405)
        end
        it 'set12' do
          expect(set12.lifetime_ascvd).to eq(0.39)
          expect(set12.ten_year_ascvd).to be_within(0.000001).of(0.020366)
        end
        it 'set13' do
          expect(set13.lifetime_ascvd).to eq(0.27)
          expect(set13.ten_year_ascvd).to be_within(0.000001).of(0.015301)
        end
        it 'set14' do
          expect(set14.lifetime_ascvd).to eq(0.39)
          expect(set14.ten_year_ascvd).to be_within(0.000001).of(0.031075)
        end
        it 'set15' do
          expect(set15.lifetime_ascvd).to eq(0.50)
          expect(set15.ten_year_ascvd).to be_within(0.000001).of(0.061965)
        end
        it 'set16' do
          expect(set16.lifetime_ascvd).to eq(0.50)
          expect(set16.ten_year_ascvd).to be_within(0.000001).of(0.095322)
        end
        it 'set17' do
          expect(set17.lifetime_ascvd).to eq(0.50)
          expect(set17.ten_year_ascvd).to be_within(0.000001).of(0.213391)
        end
        it 'set18' do
          expect(set18.lifetime_ascvd).to eq(0.50)
          expect(set18.ten_year_ascvd).to be_within(0.000001).of(0.380549)
        end
        it 'set19' do
          expect(set19.lifetime_ascvd).to eq(0.50)
          expect(set19.ten_year_ascvd).to be_within(0.000001).of(0.107466)
        end
        it 'set20' do
          expect(set20.lifetime_ascvd).to eq(0.50)
          expect(set20.ten_year_ascvd).to be_within(0.000001).of(0.112210)
        end
        it 'set21' do
          expect(set21.lifetime_ascvd).to eq(0.50)
          expect(set21.ten_year_ascvd).to be_within(0.000001).of(0.055714)
        end
      end
    end

    context "male" do
      context 'white/other' do
        let(:options) { { sex: 'M', race: 'WH' } }

        it 'set1' do
          expect(set1.lifetime_ascvd).to eq(0.05)
          expect(set1.ten_year_ascvd).to be_within(0.000001).of(0.006126)
        end
        it 'set2' do
          expect(set2.lifetime_ascvd).to eq(0.05)
          expect(set2.ten_year_ascvd).to be_within(0.000001).of(0.021132)
        end
        it 'set3' do
          expect(set3.lifetime_ascvd).to eq(0.05)
          expect(set3.ten_year_ascvd).to be_within(0.000001).of(0.052387)
        end
        it 'set4' do
          expect(set4.lifetime_ascvd).to eq(0.36)
          expect(set4.ten_year_ascvd).to be_within(0.000001).of(0.022912)
        end
        it 'set5' do
          expect(set5.lifetime_ascvd).to eq(0.46)
          expect(set5.ten_year_ascvd).to be_within(0.000001).of(0.026592)
        end
        it 'set6' do
          expect(set6.lifetime_ascvd).to eq(0.50)
          expect(set6.ten_year_ascvd).to be_within(0.000001).of(0.034384)
        end
        it 'set7' do
          expect(set7.lifetime_ascvd).to eq(0.36)
          expect(set7.ten_year_ascvd).to be_within(0.000001).of(0.024594)
        end
        it 'set8' do
          expect(set8.lifetime_ascvd).to eq(0.46)
          expect(set8.ten_year_ascvd).to be_within(0.000001).of(0.032154)
        end
        it 'set9' do
          expect(set9.lifetime_ascvd).to eq(0.50)
          expect(set9.ten_year_ascvd).to be_within(0.000001).of(0.040520)
        end
        it 'set10' do
          expect(set10.lifetime_ascvd).to eq(0.50)
          expect(set10.ten_year_ascvd).to be_within(0.000001).of(0.024633)
        end
        it 'set11' do
          expect(set11.lifetime_ascvd).to eq(0.50)
          expect(set11.ten_year_ascvd).to be_within(0.000001).of(0.040402)
        end
        it 'set12' do
          expect(set12.lifetime_ascvd).to eq(0.50)
          expect(set12.ten_year_ascvd).to be_within(0.000001).of(0.047103)
        end
        it 'set13' do
          expect(set13.lifetime_ascvd).to eq(0.36)
          expect(set13.ten_year_ascvd).to be_within(0.000001).of(0.026662)
        end
        it 'set14' do
          expect(set14.lifetime_ascvd).to eq(0.46)
          expect(set14.ten_year_ascvd).to be_within(0.000001).of(0.040404)
        end
        it 'set15' do
          expect(set15.lifetime_ascvd).to eq(0.69)
          expect(set15.ten_year_ascvd).to be_within(0.000001).of(0.065517)
        end
        it 'set16' do
          expect(set16.lifetime_ascvd).to eq(0.69)
          expect(set16.ten_year_ascvd).to be_within(0.000001).of(0.059848)
        end
        it 'set17' do
          expect(set17.lifetime_ascvd).to eq(0.69)
          expect(set17.ten_year_ascvd).to be_within(0.000001).of(0.112339)
        end
        it 'set18' do
          expect(set18.lifetime_ascvd).to eq(0.69)
          expect(set18.ten_year_ascvd).to be_within(0.000001).of(0.236005)
        end
        it 'set19' do
          expect(set19.lifetime_ascvd).to eq(0.69)
          expect(set19.ten_year_ascvd).to be_within(0.000001).of(0.116158)
        end
        it 'set20' do
          expect(set20.lifetime_ascvd).to eq(0.69)
          expect(set20.ten_year_ascvd).to be_within(0.000001).of(0.148565)
        end
        it 'set21' do
          expect(set21.lifetime_ascvd).to eq(0.69)
          expect(set21.ten_year_ascvd).to be_within(0.000001).of(0.048046)
        end
      end

      context 'african american' do
        let(:options) { { sex: 'M', race: 'AA' } }

        it 'set1' do
          expect(set1.lifetime_ascvd).to eq(0.05)
          expect(set1.ten_year_ascvd).to be_within(0.000001).of(0.022476)
        end
        it 'set2' do
          expect(set2.lifetime_ascvd).to eq(0.05)
          expect(set2.ten_year_ascvd).to be_within(0.000001).of(0.038671)
        end
        it 'set3' do
          expect(set3.lifetime_ascvd).to eq(0.05)
          expect(set3.ten_year_ascvd).to be_within(0.000001).of(0.057620)
        end
        it 'set4' do
          expect(set4.lifetime_ascvd).to eq(0.36)
          expect(set4.ten_year_ascvd).to be_within(0.000001).of(0.039331)
        end
        it 'set5' do
          expect(set5.lifetime_ascvd).to eq(0.46)
          expect(set5.ten_year_ascvd).to be_within(0.000001).of(0.040576)
        end
        it 'set6' do
          expect(set6.lifetime_ascvd).to eq(0.50)
          expect(set6.ten_year_ascvd).to be_within(0.000001).of(0.042823)
        end
        it 'set7' do
          expect(set7.lifetime_ascvd).to eq(0.36)
          expect(set7.ten_year_ascvd).to be_within(0.000001).of(0.045112)
        end
        it 'set8' do
          expect(set8.lifetime_ascvd).to eq(0.46)
          expect(set8.ten_year_ascvd).to be_within(0.000001).of(0.059185)
        end
        it 'set9' do
          expect(set9.lifetime_ascvd).to eq(0.50)
          expect(set9.ten_year_ascvd).to be_within(0.000001).of(0.074737)
        end
        it 'set10' do
          expect(set10.lifetime_ascvd).to eq(0.50)
          expect(set10.ten_year_ascvd).to be_within(0.000001).of(0.063135)
        end
        it 'set11' do
          expect(set11.lifetime_ascvd).to eq(0.50)
          expect(set11.ten_year_ascvd).to be_within(0.000001).of(0.072414)
        end
        it 'set12' do
          expect(set12.lifetime_ascvd).to eq(0.50)
          expect(set12.ten_year_ascvd).to be_within(0.000001).of(0.066009)
        end
        it 'set13' do
          expect(set13.lifetime_ascvd).to eq(0.36)
          expect(set13.ten_year_ascvd).to be_within(0.000001).of(0.045880)
        end
        it 'set14' do
          expect(set14.lifetime_ascvd).to eq(0.46)
          expect(set14.ten_year_ascvd).to be_within(0.000001).of(0.062068)
        end
        it 'set15' do
          expect(set15.lifetime_ascvd).to eq(0.69)
          expect(set15.ten_year_ascvd).to be_within(0.000001).of(0.082593)
        end
        it 'set16' do
          expect(set16.lifetime_ascvd).to eq(0.69)
          expect(set16.ten_year_ascvd).to be_within(0.000001).of(0.131014)
        end
        it 'set17' do
          expect(set17.lifetime_ascvd).to eq(0.69)
          expect(set17.ten_year_ascvd).to be_within(0.000001).of(0.234828)
        end
        it 'set18' do
          expect(set18.lifetime_ascvd).to eq(0.69)
          expect(set18.ten_year_ascvd).to be_within(0.000001).of(0.370891)
        end
        it 'set19' do
          expect(set19.lifetime_ascvd).to eq(0.69)
          expect(set19.ten_year_ascvd).to be_within(0.000001).of(0.146814)
        end
        it 'set20' do
          expect(set20.lifetime_ascvd).to eq(0.69)
          expect(set20.ten_year_ascvd).to be_within(0.000001).of(0.163652)
        end
        it 'set21' do
          expect(set21.lifetime_ascvd).to eq(0.69)
          expect(set21.ten_year_ascvd).to be_within(0.000001).of(0.145363)
        end
      end


    end
  end
end
