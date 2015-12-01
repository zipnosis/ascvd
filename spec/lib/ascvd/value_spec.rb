require 'spec_helper'

describe Ascvd::Value do
  let(:value) { Ascvd::Value.new('abcd') }


  describe 'to_s' do
    it 'is returns value' do
      expect(value.to_s).to eq(value.value)
    end
  end

  describe 'initialize' do
    it 'assigns param to value' do
      expect(value.value).to eq('abcd')
    end
  end

  describe 'name' do
    it 'strips some characters from the class name' do
      expect(value.send(:name)).to eq('')
    end
  end

end
