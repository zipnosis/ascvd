require 'spec_helper'

describe Ascvd::Value::BptreatmentValue do
  let(:true_value) { Ascvd::Value::BptreatmentValue.new(true) }
  let(:false_value) { Ascvd::Value::BptreatmentValue.new(false) }
  let(:invalid_value) { Ascvd::Value::BptreatmentValue.new('asdf') }

  describe 'valid?' do
    it 'return true when true' do
      expect(true_value).to be_valid
    end
    it 'returns true when false' do
      expect(false_value).to be_valid
    end
    it 'returns false when value is not a boolean' do
      expect(invalid_value).not_to be_valid
    end
  end

  describe 'error_message' do
    it 'is this when not valid' do
      expect(invalid_value.error_message).to eq("Bptreatment must be true or false.")
    end
  end

  it 'inherits from BooleanValue' do
    expect(true_value.class.superclass.name).to eq('Ascvd::Value::BooleanValue')
  end

end
