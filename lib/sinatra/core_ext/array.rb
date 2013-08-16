class Array
  def has_the_template?(arg)
    self.select { |x| x.check arg }.any?
  end
end
