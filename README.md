EncodingKawai - little sintax sugar for ruby force_encoding, also working on 1.8.7.

    gem 'encoding-kawai'

```ruby    
str._utf8 # str.respond_to?(:force_encoding) ? str.force_encoding('utf-8') : str
str._binary # str.respond_to?(:force_encoding) ? str.force_encoding('binary') : str
```

Extend object.
```ruby
require 'encoding-kawai/object'

[str1, str2]._utf8
{str1 => str2}._utf8
...
```