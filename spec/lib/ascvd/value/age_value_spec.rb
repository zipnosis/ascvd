require 'spec_helper'

describe Ascvd::Value::AgeValue do

  shared_examples "an age value" do
    let(:valid_value) { 50 }
    let(:below_range_value) { Ascvd::Value::AgeValue.new(min_value-1, calculator_type) }
    let(:in_range_value) { Ascvd::Value::AgeValue.new(valid_value, calculator_type) }
    let(:above_range_value) { Ascvd::Value::AgeValue.new(max_value+1, calculator_type) }

    describe 'valid?' do
      it "is invalid for ages under {min_value}" do
        expect(below_range_value).not_to be_valid
      end
      it "is valid for ages {min_value} - {max_value}" do
        (min_value..max_value).to_a.each do |i|
          expect(Ascvd::Value::AgeValue.new(i, calculator_type)).to be_valid
        end
      end
      it "is invalid for ages over {max_value}" do
        expect(above_range_value).not_to be_valid
      end
    end

    describe 'error_message' do
      it 'is nil when valid' do
        expect(in_range_value.error_message).to be_nil
      end
      it 'is this when not valid' do
        expect(above_range_value.error_message).to eq("Age must be between #{min_value} and #{max_value}.")
      end
    end

    it 'inherits from RangeValue' do
      expect(in_range_value.class.superclass.name).to eq('Ascvd::Value::RangeValue')
    end
  end

  context 'TenYearCalculator' do
    it_behaves_like 'an age value' do
      let(:calculator_type) { 'Ascvd::TenYearCalculator' }
      let(:min_value) { 40 }
      let(:max_value) { 79 }
    end
  end

  context 'LifetimeCalculator' do
    it_behaves_like 'an age value' do
      let(:calculator_type) { 'Ascvd::LifetimeCalculator' }
      let(:min_value) { 20 }
      let(:max_value) { 59 }
    end
  end

end
