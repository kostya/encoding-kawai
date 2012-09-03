if RUBY_VERSION < '1.9'

  class String
    def _utf8
      self
    end
  
    def _binary
      self
    end
  end

else 

  class String
    def _utf8
      self.force_encoding('utf-8')
    end
    
    def _binary
      self.force_encoding('binary')
    end
  end
  
end

class NilClass
  def _utf8
    self
  end

  def _binary
    self
  end
end