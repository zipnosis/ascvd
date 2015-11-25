require 'spec_helper'

describe Ascvd do

  context "female" do

    it 'test1' do
      obj = Ascvd.new(sex: 'F', age: 30, race: 'WH', cholesterol: 180, hdl: 90, systolic: 120, bptreatment: false, diabetes: false, smoker: false )
      expect(obj.lifetime_ascvd).to eq(27)
    end

  end

  context "male" do

    it 'test2' do
      obj = Ascvd.new(sex: 'M', age: 30, race: 'WH', cholesterol: 200, hdl: 90, systolic: 120, bptreatment: false, diabetes: true, smoker: false )
      expect(obj.lifetime_ascvd).to eq(50)
    end
    it 'test2' do
      obj = Ascvd.new(sex: 'M', age: 30, race: 'WH', cholesterol: 199, hdl: 90, systolic: 119, bptreatment: false, diabetes: false, smoker: false )
      expect(obj.lifetime_ascvd).to eq(36)
    end

  end

end
