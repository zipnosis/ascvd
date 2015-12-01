module LifetimeCalculator

  ISSUE_KEYS = %I{ cholesterol systolic bptreatment diabetes smoker }.freeze
  LIFETIME_VALUES = {
      "M" => [0.69,0.50,0.46,0.36,0.05],
      "F" => [0.50,0.39,0.39,0.27,0.08]
    }.freeze


  def lifetime_ascvd
    return unless valid?
    return if age < 20 or age > 59

    return LIFETIME_VALUES[sex][0] if major_issues >= 2
    return LIFETIME_VALUES[sex][1] if major_issues == 1
    return LIFETIME_VALUES[sex][2] if elevated_issues > 0
    return LIFETIME_VALUES[sex][3] if not_optimal_issues > 0
    LIFETIME_VALUES[sex][4]
  end

  private

  def major_issues
    major_issues = ISSUE_KEYS.map{ |i| @values[i].major? }.count(true)
  end

  def elevated_issues
    major_issues = ISSUE_KEYS.map{ |i| @values[i].elevated? }.count(true)
  end

  def not_optimal_issues
    major_issues = ISSUE_KEYS.map{ |i| @values[i].not_optimal? }.count(true)
  end

end
