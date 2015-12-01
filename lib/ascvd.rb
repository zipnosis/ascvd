require 'ten_year_calculator'
require 'lifetime_calculator'

class Ascvd
  include TenYearCalculator
  include LifetimeCalculator

  VALUES = %I{ sex age race cholesterol hdl systolic bptreatment diabetes smoker }.freeze

  def initialize(options={})
    @values = {}.tap do |values|
      VALUES.each do |value|
        values[value] = Object.const_get("Ascvd::#{value.capitalize}Value").new(options[value])
      end
    end
  end

  def valid?
    VALUES.all?{ |v| @values[v].valid? }
  end

  def errors
    VALUES.map{ |v| @values[v].error_message }.compact
  end

  private

  def method_missing(method_sym, *arguments, &block)
    return @values[method_sym].value if VALUES.include? method_sym
    super
  end

end

require 'ascvd/value'

require 'ascvd/boolean_value'
require 'ascvd/range_value'
require 'ascvd/value_list_value'

require 'ascvd/age_value'
require 'ascvd/bptreatment_value'
require 'ascvd/cholesterol_value'
require 'ascvd/diabetes_value'
require 'ascvd/hdl_value'
require 'ascvd/race_value'
require 'ascvd/sex_value'
require 'ascvd/smoker_value'
require 'ascvd/systolic_value'

