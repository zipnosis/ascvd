require 'spec_helper'

describe Ascvd::Value::RaceValue do
  let(:wh_value) { Ascvd::Value::RaceValue.new('WH') }
  let(:aa_value) { Ascvd::Value::RaceValue.new('AA') }
  let(:invalid_value) { Ascvd::Value::RaceValue.new('XX') }


  describe 'valid?' do
    it 'is valid for WH' do
      expect(wh_value).to be_valid
    end
    it 'is valid for AA' do
      expect(aa_value).to be_valid
    end
    it 'is invalid for any other value' do
      expect(invalid_value).not_to be_valid
    end
  end

  describe 'error_message' do
    it 'is nil when valid' do
      expect(wh_value.error_message).to be_nil
      expect(aa_value.error_message).to be_nil
    end
    it 'is this when not valid' do
      expect(invalid_value.error_message).to eq("Race must be one of [WH, AA]")
    end
  end

  describe 'valid_values' do
    it 'returns a list of valid values' do
      expect(wh_value.valid_values.sort).to eq(['AA','WH'])
    end
  end

  it 'inherits from ValueListValue' do
    expect(aa_value.class.superclass.name).to eq('Ascvd::Value::ValueListValue')
  end

end
