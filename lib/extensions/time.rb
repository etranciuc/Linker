class Time

  def humanize
    strftime "%I:%M %p, #{day.ordinalize} %B %Y"
  end

end