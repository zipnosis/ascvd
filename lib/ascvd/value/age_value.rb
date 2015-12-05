class Ascvd::Value::AgeValue < Ascvd::Value::RangeValue


  private

  def min_value
    return 40 if ten_year_calculator?
    return 20 if lifetime_calculator?
    20
  end

  def max_value
    return 79 if ten_year_calculator?
    return 59 if lifetime_calculator?
    79
  end

end
