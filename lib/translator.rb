require "yaml"

translationDup = {}

def load_library(library)
  translationDup = YAML.load_file(library)
  
  tempStorage = []
  newHash = {}
  
  translationDup.each do |val0, val1|
    translationDup[val0].each do |val1|
      tempStorage << val1
    end
    newHash[val0] = {english: "#{tempStorage[0]}", japanese: "#{tempStorage[1]}"}
    tempStorage = []
  end
  newHash
end


def get_english_meaning(library, emoticon)
  dictionary = load_library(library)
  meaning = "Sorry, that emoticon was not found"
  
  dictionary.each do |val0, val1, val2|
    dictionary[val0].each do |val1, val2|
      if dictionary[val0][val1].include?(emoticon)
        meaning = val0
      end
    end
  end
  meaning
end


def get_japanese_emoticon(library, emoticon)
  dictionary = load_library(library)
  japanese = "Sorry, that emoticon was not found"
  
  dictionary.each do |val0, val1, val2|
    dictionary[val0].each do |val1, val2|
      if dictionary[val0][val1].include?(emoticon)
        japanese = dictionary[val0][:japanese]
      end
    end
  end
  japanese
end

