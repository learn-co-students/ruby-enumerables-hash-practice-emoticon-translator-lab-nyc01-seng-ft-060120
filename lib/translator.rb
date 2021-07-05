require 'yaml'

def load_library(file_path)
emoticons = YAML.load_file(file_path)
new_path = Hash.new
emoticons.each do |key, meaning|
  new_path[key] = Hash.new
  new_path[key][:english] = meaning[0]
  new_path[key][:japanese] = meaning[1]
end
new_path

end

def get_japanese_emoticon(file_path, americanemoji)
  new_library = load_library(file_path)
  americanemoji = new_library.keys.find do |key|
    new_library[key][:english] == americanemoji
end
americanemoji ? new_library[americanemoji][:japanese] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, japanseemoji)
  library = load_library(file_path)
  japanseemoji = library.keys.find do |key|
    library[key][:japanese] == japanseemoji
end
japanseemoji ? japanseemoji : "Sorry, that emoticon was not found"
end
