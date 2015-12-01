require 'spec_helper'

describe Ascvd::SexValue do
  let(:m_value) { Ascvd::SexValue.new('M') }
  let(:f_value) { Ascvd::SexValue.new('F') }
  let(:invalid_value) { Ascvd::SexValue.new('X') }


  describe 'valid?' do
    it 'is valid for M' do
      expect(m_value).to be_valid
    end
    it 'is valid for F' do
      expect(f_value).to be_valid
    end
    it 'is invalid for any other value' do
      expect(invalid_value).not_to be_valid
    end
  end

  describe 'error_message' do
    it 'is nil when valid' do
      expect(m_value.error_message).to be_nil
      expect(f_value.error_message).to be_nil
    end
    it 'is this when not valid' do
      expect(invalid_value.error_message).to eq("Sex must be one of [M, F]")
    end
  end

  describe 'valid_values' do
    it 'returns a list of valid values' do
      expect(m_value.valid_values.sort).to eq(['F','M'])
    end
  end

  it 'inherits from ValueListValue' do
    expect(m_value.class.superclass.name).to eq('Ascvd::ValueListValue')
  end

end
