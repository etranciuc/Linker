class String

  def to_bool
    return true if self == true or self =~ /(true|t|yes|y|1)$/i
    return false if self == false or self.blank? or self =~ /(false|f|no|n|0)$/i

    raise ArgumentError.new "invalid value for Boolean: \"#{self}\""
  end


  def capitalize_first
    string = self
    string[0] = string[0].capitalize
    string
  end


  def capitalize_first!
    replace capitalize_first
  end



  def continuous
    self.gsub(/,/, "").gsub(/\s+/, "_")
  end

  def continuous!
    replace continuous
  end



  def nameize
    case self
    when / /
      split(" ").each { |word| word.nameize! }.join " "

    when /^[A-Z][^A-Z]+/ # already capitalized
      self

    when /^(mac|mc)(\w)(.*)$/i
      "#{$1.capitalize}#{$2.capitalize}#{$3}"

    when /^o\'/i
      split("'").each{ |word| word.capitalize! }.join "'"

    else # if not Irish/Scottish then capitalize
      capitalize

    end
  end


  def nameize!
    replace nameize
  end


  def first_name
    full_name = self.gsub /(dr|mr|miss|ms|sir)\s+/i, ''
    full_name.split(" ")[0] || ""
  end


  def last_name
    names = self.split " "
    names.length <= 1 ? "" : names[-1]
  end



  def phoneize
    if self.blank?
      ""

    else
      return ActionController::Base.helpers.number_to_phone self,
        area_code: true, delimiter: ' ', country_code: 1
    end
  end


  def phoneize!
    replace phoneize
  end

end
