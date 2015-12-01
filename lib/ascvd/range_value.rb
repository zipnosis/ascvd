class Ascvd::RangeValue < Ascvd::Value

  def valid?
    value && min_value <= value && value <= max_value
  end

  def error_message
    "#{name} must be between #{min_value} and #{max_value}." unless valid?
  end

  def not_optimal?
    not_optimal_value <= value && value < elevated_value
  end

  def elevated?
    elevated_value <= value && value < major_value
  end

  def major?
    major_value <= value
  end


  private

  def min_value
    self.class::MIN_VALUE
  end

  def max_value
    self.class::MAX_VALUE
  end

  def not_optimal_value
    self.class::NOT_OPTIMAL_VALUE
  end

  def elevated_value
    self.class::ELEVATED_VALUE
  end

  def major_value
    self.class::MAJOR_VALUE
  end

end
