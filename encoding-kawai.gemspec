# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{encoding-kawai}
  s.version = "0.3"

  s.authors = ["Makarchev K"]
  
  s.description = %q{EncodingKawai - little sintax sugar for ruby force_encoding, also working on 1.8.7.}
  s.summary = %q{Encodingkawai - little sintax sugar for ruby force_encoding, also working on 1.8.7.}

  s.email = %q{kostya27@gmail.com}
  #s.homepage = %q{http://github.com/kostya/encoding-kawai}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"

end