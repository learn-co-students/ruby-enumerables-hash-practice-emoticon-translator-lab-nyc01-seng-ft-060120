# require modules here
require 'pry'
require "yaml"

#hash = YAML.load_file('lib/emoticons.yml')
#binding.pry


def load_library(file)
  hash = YAML.load_file('lib/emoticons.yml')
  new_data = {}
  hash.each do |name, array| 
    new_data[name] = {}
    new_data[name][:english] = array[0]
    new_data[name][:japanese] = array[1]
  end
  new_data
end

# library = load_library('./lib/emoticons.yml')
# binding.pry

def get_english_meaning(file, emoticon)
  library = load_library(file)
  library.each do |name, emoti|
    if emoti[:japanese] == emoticon
      return name
    end
  end
  "Sorry, that emoticon was not found"
end




def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  library.each do |name, emoti|
    if emoti[:english] == emoticon
      return emoti[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end



