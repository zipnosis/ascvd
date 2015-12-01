require 'spec_helper'

describe Ascvd::HdlValue do
  let(:below_range_value) { Ascvd::HdlValue.new(19) }
  let(:in_range_value) { Ascvd::HdlValue.new(50) }
  let(:above_range_value) { Ascvd::HdlValue.new(101) }


  describe 'valid?' do
    it 'is invalid for values less than 20' do
      expect(below_range_value).not_to be_valid
    end
    it 'is valid for values 20 - 100' do
      (20..100).to_a.each do |i|
        expect(Ascvd::HdlValue.new(i)).to be_valid
      end
    end
    it 'is invalid for ages over 100' do
      expect(above_range_value).not_to be_valid
    end
  end

  describe 'error_message' do
    it 'is nil when valid' do
      expect(in_range_value.error_message).to be_nil
    end
    it 'is this when not valid' do
      expect(above_range_value.error_message).to eq("Hdl must be between 20 and 100.")
    end
  end

  it 'inherits from RangeValue' do
    expect(in_range_value.class.superclass.name).to eq('Ascvd::RangeValue')
  end

end
