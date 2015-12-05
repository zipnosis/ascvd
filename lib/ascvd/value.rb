class Ascvd::Value
  attr_accessor :value

  def initialize(value, calculator_class = nil)
    @value = value
    @calculator_class = calculator_class
  end

  def valid?
    raise NotImplementedError
  end

  def error_message
    raise NotImplementedError
  end

  def not_optimal?
    raise NotImplementedError
  end

  def elevated?
    raise NotImplementedError
  end

  def major?
    raise NotImplementedError
  end

  def to_s
    value
  end

  private

  def ten_year_calculator?
    @calculator_class == 'Ascvd::TenYearCalculator'
  end

  def lifetime_calculator?
    @calculator_class == 'Ascvd::LifetimeCalculator'
  end

  def name
    self.class.name.gsub(/Ascvd|::|Value/,"")
  end

end
