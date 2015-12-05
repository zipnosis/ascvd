require 'spec_helper'

describe Ascvd::Value::SystolicValue do
  let(:below_range_value) { Ascvd::Value::SystolicValue.new(89) }
  let(:in_range_value) { Ascvd::Value::SystolicValue.new(150) }
  let(:above_range_value) { Ascvd::Value::SystolicValue.new(201) }


  describe 'valid?' do
    it 'is invalid for values under 90' do
      expect(below_range_value).not_to be_valid
    end
    it 'is valid for values 90-200' do
      (90..200).to_a.each do |i|
        expect(Ascvd::Value::SystolicValue.new(i)).to be_valid
      end
    end
    it 'is invalid for values over 200' do
      expect(above_range_value).not_to be_valid
    end
  end

  describe 'error_message' do
    it 'is nil when valid' do
      expect(in_range_value.error_message).to be_nil
    end
    it 'is this when not valid' do
      expect(above_range_value.error_message).to eq("Systolic must be between 90 and 200.")
    end
  end

  it 'inherits from RangeValue' do
    expect(in_range_value.class.superclass.name).to eq('Ascvd::Value::RangeValue')
  end


  describe 'not_optimal?' do
    it 'is true for values between 120 and 139' do
      (90..200).to_a.each do |i|
        tf = i >= 120 && i <= 139
        expect(Ascvd::Value::SystolicValue.new(i).not_optimal?).to eq(tf)
      end
    end
  end

  describe 'elevated?' do
    it 'is true for values between 140 and 159' do
      (90..200).to_a.each do |i|
        tf = i >= 140 && i <= 159
        expect(Ascvd::Value::SystolicValue.new(i).elevated?).to eq(tf)
      end
    end
  end

  describe 'major?' do
    it 'is true for values 160 and above' do
      (90..200).to_a.each do |i|
        tf = i >= 160
        expect(Ascvd::Value::SystolicValue.new(i).major?).to eq(tf)
      end
    end
  end

end


