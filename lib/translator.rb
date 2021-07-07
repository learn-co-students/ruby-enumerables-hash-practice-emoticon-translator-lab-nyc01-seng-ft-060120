# require modules here
 require "yaml"
 require "pry"

def load_library(file_path)
 #code goes here
  emo = YAML.load_file("lib/emoticons.yml")
  
  new_hash = {}
  emo.each do |key, value|
  new_hash[key] = {}  
  new_hash[key][:english] = value[0]
  new_hash[key][:japanese] = value[1]
  
  end
new_hash
end

def get_japanese_emoticon(file_path, emo)
  library = load_library(file_path)
  found_emo = library.keys.find do |key|
    library[key][:english] == emo
  end
  if found_emo
    library[found_emo][:japanese]
  else
    "Sorry, that emoticon was not found"
  end

end

def get_english_meaning(file_path, emo)
  library = load_library(file_path)
  found_emo = library.keys.find do |key|
    library[key][:japanese] == emo
  end
  if found_emo
    found_emo
  else
    "Sorry, that emoticon was not found"
  end

end 
