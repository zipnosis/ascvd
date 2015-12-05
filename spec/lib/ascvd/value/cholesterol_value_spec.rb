require 'spec_helper'

describe Ascvd::Value::CholesterolValue do
  let(:below_range_value) { Ascvd::Value::CholesterolValue.new(129) }
  let(:in_range_value) { Ascvd::Value::CholesterolValue.new(200) }
  let(:above_range_value) { Ascvd::Value::CholesterolValue.new(321) }


  describe 'valid?' do
    it 'is invalid for values under 130' do
      expect(below_range_value).not_to be_valid
    end
    it 'is valid for values 130-320' do
      (130..320).to_a.each do |i|
        expect(Ascvd::Value::CholesterolValue.new(i)).to be_valid
      end
    end
    it 'is invalid for values over 320' do
      expect(above_range_value).not_to be_valid
    end
  end

  describe 'error_message' do
    it 'is nil when valid' do
      expect(in_range_value.error_message).to be_nil
    end
    it 'is this when not valid' do
      expect(above_range_value.error_message).to eq("Cholesterol must be between 130 and 320.")
    end
  end

  it 'inherits from RangeValue' do
    expect(in_range_value.class.superclass.name).to eq('Ascvd::Value::RangeValue')
  end


  describe 'not_optimal?' do
    it 'is true for values between 180 and 199' do
      (130..320).to_a.each do |i|
        tf = i >= 180 && i <= 199
        expect(Ascvd::Value::CholesterolValue.new(i).not_optimal?).to eq(tf)
      end
    end
  end

  describe 'elevated?' do
    it 'is true for values between 200 and 239' do
      (130..320).to_a.each do |i|
        tf = i >= 200 && i <= 239
        expect(Ascvd::Value::CholesterolValue.new(i).elevated?).to eq(tf)
      end
    end
  end

  describe 'major?' do
    it 'is true for values 240 and above' do
      (130..320).to_a.each do |i|
        tf = i >= 240
        expect(Ascvd::Value::CholesterolValue.new(i).major?).to eq(tf)
      end
    end
  end

end

