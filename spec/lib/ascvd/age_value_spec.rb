require 'spec_helper'

describe Ascvd::AgeValue do
  let(:below_range_value) { Ascvd::AgeValue.new(-1) }
  let(:in_range_value) { Ascvd::AgeValue.new(20) }
  let(:above_range_value) { Ascvd::AgeValue.new(111) }


  describe 'valid?' do
    it 'is invalid for ages under 0' do
      expect(below_range_value).not_to be_valid
    end
    it 'is valid for ages 1 - 110' do
      (0..110).to_a.each do |i|
        expect(Ascvd::AgeValue.new(i)).to be_valid
      end
    end
    it 'is invalid for ages over 110' do
      expect(above_range_value).not_to be_valid
    end
  end

  describe 'error_message' do
    it 'is nil when valid' do
      expect(in_range_value.error_message).to be_nil
    end
    it 'is this when not valid' do
      expect(above_range_value.error_message).to eq("Age must be between 0 and 110.")
    end
  end

  it 'inherits from RangeValue' do
    expect(in_range_value.class.superclass.name).to eq('Ascvd::RangeValue')
  end

end
