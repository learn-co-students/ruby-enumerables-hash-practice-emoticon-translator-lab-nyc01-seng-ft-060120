require "yaml"
require "pry"
# require modules here

def load_library (file)
  # code goes here
  emoticons = YAML.load_file('./lib/emoticons.yml')
emo = {}
  emoticons.each do |name,arrays|
      emo[name] ||= {}
      emo[name][:english] = arrays[0]
      emo[name][:japanese] = arrays[1]
  end
emo
end
      

def get_japanese_emoticon(file_path, eng_emo)
  # code goes here
  library = load_library('./lib/emoticons.yml')
  library.each do |meaning, idioms|
      return idioms[:japanese] if idioms[:english] == eng_emo
  end
  "Sorry, that emoticon was not found"
end
def get_english_meaning(file_path, jap_emo)
  # code goes here
  library = load_library('./lib/emoticons.yml')
  library.each do |meaning, idioms|
    return meaning if idioms[:japanese] == jap_emo
  end
    "Sorry, that emoticon was not found"
 end 