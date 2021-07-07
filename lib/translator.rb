# require modules here
require 'pry'
require "yaml"

def load_library(file_path)
  
 emoticons = YAML.load_file(file_path)

  new_hash = {}
  emoticons.each do |emotion, symbols|
    new_hash[emotion]={
      :english=>symbols[0],
      :japanese=>symbols[1]
    }

  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  jap_symbol="Sorry, that emoticon was not found"
  result=load_library(file_path)
  #binding.pry
  result.each do|emotion, symbols|
    if symbols[:english]==emoticon
      jap_symbol=symbols[:japanese]
    end
  end 
  jap_symbol
 
  
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  eng_symbol="Sorry, that emoticon was not found"
  result=load_library(file_path)
  result.each do|emotion, symbols|
    if symbols[:japanese]==emoticon
      eng_symbol=emotion
    end 
  end
  eng_symbol
end 
