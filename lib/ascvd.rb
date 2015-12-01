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
    return if age < 40 or age > 79

    chart = {
      'M' => {
        'AA' => [0.89536, 19.5425, male_aa],
        'WH' => [0.91436, 61.1816, male_wh]
      },
      'F' => {
        'AA' => [0.95334, 86.6081, female_aa],
        'WH' => [0.96652, -29.1817, female_wh]
      }
    }
    item = chart[sex][race]
    1-(item[0]**(Math.exp(item[2]-item[1])))
  end

  def lifetime_ascvd
    return unless valid?
    return if age < 20 or age > 59

    chart = {
      "M" => [0.69,0.50,0.46,0.36,0.05],
      "F" => [0.50,0.39,0.39,0.27,0.08]
    }

    return chart[sex][0] if major_issues >= 2
    return chart[sex][1] if major_issues == 1
    return chart[sex][2] if elevated_issues > 0
    return chart[sex][3] if not_optimal_issues > 0
    chart[sex][4]
  end


  def method_missing(method_sym, *arguments, &block)
    return @values[method_sym].value if VALUES.include? method_sym
    super
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




  def ln_age
    Math.log(age)
  end

  def ln_cholesterol
    Math.log(cholesterol)
  end

  def ln_hdl
    Math.log(hdl)
  end

  def ln_systolic
    Math.log(systolic)
  end

  def ln_systolic_if_treatment
    bptreatment ? ln_systolic : 0
  end

  def ln_systolic_if_no_treatment
    !bptreatment ? ln_systolic : 0
  end

  def age_squared
    ln_age * ln_age
  end

  def age_cholesterol
    ln_age * ln_cholesterol
  end

  def age_systolic_if_treatment
    ln_age * ln_systolic_if_treatment
  end

  def age_systolic_if_no_treatment
    ln_age * ln_systolic_if_no_treatment
  end

  def age_hdl
    ln_age * ln_hdl
  end

  def age_smoker
    smoker ? ln_age : 0
  end

  def is_smoker
    smoker ? 1 : 0
  end

  def is_diabetes
    diabetes ? 1 : 0
  end

  def male_wh
    12.344*ln_age+11.853*ln_cholesterol+(-2.664*age_cholesterol)+(-7.99*ln_hdl)+1.769*age_hdl+1.797*ln_systolic_if_treatment+1.764*ln_systolic_if_no_treatment+7.837*is_smoker+(-1.795*age_smoker)+0.658*is_diabetes
  end

  def male_aa
    2.469*ln_age+0.302*ln_cholesterol+(-0.307*ln_hdl)+1.916*ln_systolic_if_treatment+1.809*ln_systolic_if_no_treatment+0.549*is_smoker+0.645*is_diabetes
  end

  def female_wh
    (-29.799*ln_age)+4.884*age_squared+13.54*ln_cholesterol+(-3.114*age_cholesterol)+(-13.578*ln_hdl)+3.149*age_hdl+2.019*ln_systolic_if_treatment+1.957*ln_systolic_if_no_treatment+7.574*is_smoker+(-1.665*age_smoker)+0.661*is_diabetes
  end

  def female_aa
    17.1141*ln_age+0.9396*ln_cholesterol+(-18.9196*ln_hdl)+4.4748*age_hdl+29.2907*ln_systolic_if_treatment+(-6.4321*age_systolic_if_treatment)+27.8197*ln_systolic_if_no_treatment+(-6.0873*age_systolic_if_no_treatment)+0.6908*is_smoker+0.8738*is_diabetes
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

