require 'pry'
require 'yaml'

def load_library (path)
  new_hash = {}
  emoticons = {"get_meaning"=> {}, "get_emoticon"=>{}}
  emotion_hash = YAML.load_file(path)
  emotion_hash.each do |emotion, emoticon|
    new_hash[emotion] = {
      :english=> emoticon[0],
      :japanese=> emoticon[1]
    }
  end
  new_hash
end

def get_japanese_emoticon (path, emoticon)
  new_hash = load_library(path)
  japanese_emoticon = nil
  new_hash.each do |emotion, emoticon_hash|
    if emoticon_hash[:english] == emoticon
      japanese_emoticon = emoticon_hash[:japanese]
    end
  end
if japanese_emoticon != nil
  japanese_emoticon
else
  "Sorry, that emoticon was not found"
end
end

def get_english_meaning (path, emoticon)
  new_hash = load_library(path)
  english_meaning = nil
  new_hash.each do |emotion, emoticon_hash|
    if emoticon_hash[:japanese] == emoticon
      english_meaning = emotion
    end
  end
  if english_meaning != nil
    english_meaning
  else
    "Sorry, that emoticon was not found"
  end
  end
