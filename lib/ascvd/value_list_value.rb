class Ascvd::ValueListValue < Ascvd::Value

  def valid?
    valid_values.include? value
  end

  def error_message
    "#{name} must be one of [#{valid_values.join(', ')}]" unless valid?
  end

  def valid_values
    self.class::VALID_VALUES
  end

end
