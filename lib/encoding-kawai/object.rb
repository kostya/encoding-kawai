class Object
  def utf8!
    self
  end

  def binary!
    self
  end
end

if RUBY_VERSION >= '1.9'
  class Array
    def utf8!
      map { |a| a.utf8! }
    end

    def binary!
      map { |a| a.binary! }
    end
  end

  class Regexp
    def utf8!
      Regexp.new(to_s.utf8!)
    end

    def binary!
      Regexp.new(to_s.binary!)
    end
  end

  class Hash
    def utf8!
      {}.tap{|h| 
        keys.each { |k| h[(k.frozen? && !k.is_a?(Symbol) && !k.is_a?(Fixnum)) ? k.dup.utf8! : k.utf8!] = self[k].utf8! }
      }
    end

    def binary!
      {}.tap{|h| 
        keys.each { |k| h[(k.frozen? && !k.is_a?(Symbol) && !k.is_a?(Fixnum)) ? k.dup.binary! : k.binary!] = self[k].binary! }
      }
    end
  end

end