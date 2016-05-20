require 'byebug'

def first_anagram?(string, match)
  orders = string.chars.permutation.to_a
  orders.map(&:join).include?(match)
end

def second_anagram?(string, match)
  string.length.times do
    first_char = string[0]
    string[0] = ""
    match.sub!(first_char, "")
  end
  match == ""
end

def third_anagram?(string, match)
  string.chars.sort.join == match.chars.sort.join
end

def fourth_anagram?(string, match)
  frequency = Hash.new(0)
  string.each_char do |chr|
    frequency[chr] += 1
  end
  match.each_char do |chr|
    frequency[chr] -= 1
  end
  frequency.all? { |_, val| val.zero? }
end

a = Time.now
p second_anagram?("elvisaa", "livesaa")
p Time.now - a

a = Time.now
p third_anagram?("elvisaa", "livesaa")
p Time.now - a

a = Time.now
p fourth_anagram?("elvisaa", "livesaa")
p Time.now - a
