class Integer

  def round_to_nearest(precision)
    (self.to_f / precision).round * precision
  end


  def round_to_nearest!(precision)
    replace round_to_nearest(precision)
  end


  def humanize
    self.to_s.gsub /(\d)(?=(\d\d\d)+(?!\d))/, "\\1,"
  end

end
