class Date

  def humanize
    strftime "#{day.ordinalize} %B, %Y"
  end

end