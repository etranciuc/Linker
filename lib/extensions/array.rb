class ::Array

  # only for arrays of objects
  def key_by(attribute, replace_duplicates = true)
    if replace_duplicates
      hash = Hash[ self.map { |object| [object.send(attribute), object] } ]

    else
      hash = {}
      self.each do |object|
        key = object.send(attribute)

        if hash.has_key? key
          if hash[key].class.name == 'Array'
            hash[key] << object

          else
            hash[key] = [ hash[key], object ]
          end

        else
          hash[key] = object
        end
      end
    end

    hash
  end


  def delete_multiple(values)
    if "Array" == values.class.name
      values.each { |value| delete value }
    else
      delete values
    end
  end


  def and_elements
    result = true
    self.each do |value|
      result &= value
    end
    result
  end


  def or_elements
    result = false
    self.each do |value|
      result ||= value
    end
    result
  end

end
