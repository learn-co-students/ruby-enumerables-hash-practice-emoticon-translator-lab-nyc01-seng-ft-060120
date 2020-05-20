# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  final = emoticons.each_with_object({}) do |(emotion, emotes), hash|
    hash[emotion] = {:english => emotes[0], :japanese => emotes[-1]}
  end
  final
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  ans = ""
  hash = load_library(file_path)
  hash.each do |key, values|
    values.each do |inner_key, value|
      if values[inner_key] == emoticon
        ans = values[:japanese]
      end
    end
  end
 return ans if ans != ""
 return "Sorry, that emoticon was not found" if ans == ""
end

def get_english_meaning(file_path, emoticon)
  # code goes here
    ans = ""
  hash = load_library(file_path)
  hash.each do |key, values|
    values.each do |inner_key, value|
      if values[inner_key] == emoticon
        ans = key
      end
    end
  end
 return ans if ans != ""
 return "Sorry, that emoticon was not found" if ans == ""
end