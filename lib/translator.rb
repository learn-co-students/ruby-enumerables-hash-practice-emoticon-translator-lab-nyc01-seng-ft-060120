# require modules here
require 'yaml'
require "pry"

def load_library(path)
  emoticons = YAML.load_file(path)
  new_hash = {}
  emoticons.each do |emotion_string, emoticon_array|
    new_hash[emotion_string] = {}
    new_hash[emotion_string][:english] = emoticon_array[0]
    new_hash[emotion_string][:japanese] = emoticon_array[1]
  end
  new_hash
end


def get_japanese_emoticon(path, english_emoticon)
  new_hash = load_library(path)
  emotion = new_hash.keys.find do |key|
  new_hash[key][:english] == english_emoticon
  end
  if emotion 
    new_hash[emotion][:japanese]
  else 
   "Sorry, that emoticon was not found"
  end
end


def get_english_meaning (path, japanese_emoticon)
  new_hash = load_library(path)
  emotion = new_hash.keys.find do |key|
  new_hash[key][:japanese] == japanese_emoticon
  end
  if emotion
    emotion
  else
   "Sorry, that emoticon was not found" 
  end
end



