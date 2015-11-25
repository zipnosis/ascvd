class Ascvd
  # attr_reader :values

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

  def ten_year_ascvd
    return unless valid?
  end

  def lifetime_ascvd
    return unless valid?

    chart = {
      "M" => [69,50,46,36,5],
      "F" => [50,39,39,27,8]
    }

    return chart[@values[:sex].value][0] if major_issues >= 2
    return chart[@values[:sex].value][1] if major_issues == 1
    return chart[@values[:sex].value][2] if elevated_issues > 0
    return chart[@values[:sex].value][3] if not_optimal_issues > 0
    chart[@values[:sex]][4]
  end


  private

  def major_issues
    major_issues = %I{ cholesterol systolic bptreatment diabetes smoker }.map{ |i| @values[i].major? }.count(true)
  end

  def elevated_issues
    major_issues = %I{ cholesterol systolic bptreatment diabetes smoker }.map{ |i| @values[i].elevated? }.count(true)
  end

  def not_optimal_issues
    major_issues = %I{ cholesterol systolic bptreatment diabetes smoker }.map{ |i| @values[i].not_optimal? }.count(true)
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

