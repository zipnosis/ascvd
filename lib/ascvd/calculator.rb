class Ascvd::Calculator
  attr_reader :values
  VALUES = %I{ sex age race cholesterol hdl systolic bptreatment diabetes smoker }.freeze

  def initialize(options={})
    @values = {}.tap do |values|
      required_values.each do |value|
        values[value] = Object.const_get("Ascvd::Value::#{value.capitalize}Value").new(options[value], self.class.name)
      end
    end
  end

  def valid?
    required_values.all?{ |v| @values[v].valid? }
  end

  def errors
    required_values.map{ |v| @values[v].error_message }.compact
  end

  def ten_year_ascvd
    to_ten_year_calculator.value
  end

  def lifetime_ascvd
    to_lifetime_calculator.value
  end

  def to_ten_year_calculator
    Ascvd::TenYearCalculator.new(to_h)
  end

  def to_lifetime_calculator
    Ascvd::LifetimeCalculator.new(to_h)
  end

  def to_h
    {}.tap do |h|
      @values.each{ |k, v| h[k] = v.value }
    end
  end

  private

  def required_values
    self.class::VALUES
  end

  def method_missing(method_sym, *arguments, &block)
    return @values[method_sym].value if required_values.include? method_sym
    super
  end

end
