class Ascvd::Value
  attr_accessor :value

  def initialize(value)
    @value = value
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

  def name
    self.class.name.gsub(/Ascvd::|Value/,"")
  end

end
