# require modules here
require "yaml"
require 'pry'

def load_library(path)
  # code goes here
  myHash = YAML.load_file(path)
  val = myHash.each_with_object({}) do |(name, data), output|
    data.each do |emoticon|
      if !output[name]
        output[name] = {}
      end
      if !output[name][:english]
        output[name][:english] = emoticon
      elsif !output[name][:japanese]
        output[name][:japanese] = emoticon
      end
    end
  end
  val
end

def get_japanese_emoticon(path, english_emote)
  # code goes here
  output = "Sorry, that emoticon was not found"
  myHash = load_library(path)
  myHash.each do |name, data|
    data.each do |language, emoticon|
      if english_emote == emoticon
        output = data[:japanese]
      end
    end
  end
  output
end

def get_english_meaning(path, jap_emote)
  # code goes here
  output = "Sorry, that emoticon was not found"
  myHash = load_library(path)
  myHash.each do |name, data|
    data.each do |language, emoticon|
      if jap_emote == emoticon
        output = name
      end
    end
  end
  output
end
