require "yaml"
require "pry"

def load_library (file_path)
  results_hash = {}
  hash_of_emos = YAML.load_file(file_path)
  hash_of_emos.each do |k_word, v_array|
    results_hash[k_word] = {
      english: v_array[0],
      japanese: v_array[1]
    }


  end
  # binding.pry
  results_hash
end

def get_japanese_emoticon(file_path, emojinglish)
  awesome_hash = load_library(file_path)
  awesome_hash.each do |k_word_string, v_emos_hash|
    if v_emos_hash[:english] == emojinglish
      return v_emos_hash[:japanese]
    end

  end
return "Sorry, that emoticon was not found"
end

def get_english_meaning (file_path, emonnipon)
  wonderful_hash = load_library(file_path)
  wonderful_hash.each do |k_word_string, v_emos_hash|
    if v_emos_hash[:japanese] == emonnipon
      return k_word_string
    end

  end
return "Sorry, that emoticon was not found"
  # code goes here
end
