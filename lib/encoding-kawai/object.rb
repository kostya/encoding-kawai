class Object
  def _utf8
    self
  end

  def _binary
    self
  end
end

if RUBY_VERSION >= '1.9'
  class Array
    def _utf8
      map { |a| a._utf8 }
    end

    def _binary
      map { |a| a._binary }
    end
  end

  class Regexp
    def _utf8
      Regexp.new(to_s._utf8)
    end

    def _binary
      Regexp.new(to_s._binary)
    end
  end

  class Hash
    def _utf8
      {}.tap{|h| 
        keys.each { |k| h[k.frozen? ? k.dup._utf8 : k._utf8] = self[k]._utf8 }
      }
    end

    def _binary
      {}.tap{|h| 
        keys.each { |k| h[k.frozen? ? k.dup._binary : k._binary] = self[k]._binary }
      }
    end
  end

end