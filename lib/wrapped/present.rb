class Present
  include Enumerable

  def initialize(value)
    @value = value
  end

  def unwrap_or(_)
    if block_given?
      yield unwrap
    else
      unwrap
    end
  end

  def present(&block)
    block.call(unwrap)
    self
  end

  def blank(&ignored)
    self
  end

  def each
    yield unwrap if block_given?
    [unwrap]
  end

  def unwrap
    @value
  end

  def present?
    true
  end

  def blank?
    false
  end

  def try
    yield unwrap
  end

  def fmap
    (yield unwrap).wrapped
  end
end