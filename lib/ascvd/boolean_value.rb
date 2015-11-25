class Ascvd::BooleanValue < Ascvd::Value

  def valid?
    !!value == value
  end

  def error_message
    "#{name} must be true or false." unless valid?
  end

  def not_optimal?
    false
  end

  def elevated?
    false
  end

  def major?
    value
  end


end
