class ::Hash

  def delete_keys(keys)
    if "Array" == keys.class.name
      keys.each { |key| delete key }
    else
      delete keys
    end
  end


  def delete_nil
    delete_if { |value| value.nil? }
  end

end
