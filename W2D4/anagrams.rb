require 'byebug'
def first_anagram?(string1, string2)
  string1.chars.permutation.to_a.map(&:join).include?(string2)
end

def second_anagram?(string1, string2)

  loop do 
    c = string1[0]
    if string2.include?(c) && string2.count(c) == string1.count(c)
      string2.delete!(c) 
      string1.delete!(c)
    else
      return false
    end 
    return false unless string1.size == string2.size
    break if string1.empty?
  end  
  true
end

def third_anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end

def fourth_anagram?(string1, string2)
  string1_hash = Hash.new(0)
  string2_hash = Hash.new(0)
  string1.each_char { |c| string1_hash[c] += 1 }
  string2.each_char { |c| string2_hash[c] += 1 }
  string1_hash == string2_hash
end


word1 = "gizmo"
word2 = "sally"
word3 = "elvis"
word4 = "lives"

# p first_anagram?(word1, word2)
# p first_anagram?(word3, word4)
# p second_anagram?(word1, word2)
# p second_anagram?(word3, word4)
# p third_anagram?(word1, word2)
# p third_anagram?(word3, word4)
p third_anagram?(word1, word2)
p third_anagram?(word3, word4)

