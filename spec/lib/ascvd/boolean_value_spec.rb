require 'spec_helper'

describe Ascvd::BooleanValue do
  let(:true_value) { Ascvd::BooleanValue.new(true) }
  let(:false_value) { Ascvd::BooleanValue.new(false) }
  let(:invalid_value) { Ascvd::BooleanValue.new('asdf') }

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
    it 'is nil when valid' do
      expect(true_value.error_message).to be_nil
      expect(false_value.error_message).to be_nil
    end
    it 'is this when not valid' do
      expect(invalid_value.error_message).to eq("Boolean must be true or false.")
    end
  end

  describe 'not_optimal?' do
    it 'always returns false' do
      expect(true_value).not_to be_not_optimal
      expect(false_value).not_to be_not_optimal
      expect(invalid_value).not_to be_not_optimal
    end
  end

  describe 'elevated?' do
    it 'always returns false' do
      expect(true_value).not_to be_elevated
      expect(false_value).not_to be_elevated
      expect(invalid_value).not_to be_elevated
    end
  end

  describe 'value' do
    it 'returns true when true' do
      expect(true_value.value).to eq(true)
    end
    it 'returns false when false' do
      expect(false_value.value).to eq(false)
    end
    it 'returns value when invalid' do
      expect(invalid_value.value).to eq('asdf')
    end
  end

end
