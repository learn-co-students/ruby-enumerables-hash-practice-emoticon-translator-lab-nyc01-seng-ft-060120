require "yaml"


def load_library(filepath)
 emoticon_list = YAML.load_file(filepath)
   emoti_hash = {}
   emoticon_list.each do |key, value| 
   emoti_hash[key] = {}
   emoti_hash[key][:english] = value[0]
   emoti_hash[key][:japanese] = value[1]
  end
  emoti_hash
end


def get_english_meaning(filepath, emoticon)
  translating_hash = load_library(filepath)
   translating_hash.each do |key, value|
   if value[:japanese] == emoticon
     return key
   end
 end
 return "Sorry, that emoticon was not found"
end



def get_japanese_emoticon(filepath, emoticon)
  translating_hash = load_library(filepath)
   translating_hash.each do |key, value|
     if value[:english] == emoticon
       return value[:japanese]
     end
   end
   return "Sorry, that emoticon was not found"
end