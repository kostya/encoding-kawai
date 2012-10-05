if RUBY_VERSION < '1.9'

  class String
    def utf8!
      self
    end
  
    def binary!
      self
    end
  end

else 

  class String
    def utf8!
      self.force_encoding('utf-8')
    end
    
    def binary!
      self.force_encoding('binary')
    end
  end
  
end

class NilClass
  def utf8!
    self
  end

  def binary!
    self
  end
end