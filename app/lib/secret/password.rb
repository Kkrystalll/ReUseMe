module Secret
  module Code
    def self.digest_password(password)
      Digest::SHA1.hexdigest(solt_password(password))
    end
  
    def self.solt_password(str)
      arr = ["a","b","c","d","e","f"]
      str_arr = str.chars[0..5]
      str_arr2 = str.chars[6..]
      answer = str_arr.zip(arr).join
      "z#{answer}#{str_arr2}y"
    end
  end
end