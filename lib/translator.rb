

require 'pry'

require 'yaml'


#------------------------------------------------------------------------


def load_library(file_path)
  emoticons = YAML.load_file(file_path)

  emoticon_translation = {}

	emoticons.each do |emotion, emotes|
		emoticon_translation[emotion] ||= {}

		emoticon_translation[emotion][:english] = emotes[0]

		emoticon_translation[emotion][:japanese] = emotes[1]
	end

  emoticon_translation
end


#------------------------------------------------------------------------


def get_english_meaning(file_path, jap_emote)
  emoticon_hash = load_library('./lib/emoticons.yml')

  emotional = nil

  emoticon_hash.each do |emotion, emotes|
    if emotes[:japanese] == jap_emote
      emotional = emotion
    end
  end

  if emotional == nil
    "Sorry, that emoticon was not found"
  else
    emotional
  end
end


#------------------------------------------------------------------------


def get_japanese_emoticon(file_path, west_emote)
  emoticon_hash = load_library('./lib/emoticons.yml')

  chosen_emote = nil

  emoticon_hash.each do |emotion, emotes|
    if emotes[:english] == west_emote
      chosen_emote = emotion
    end
  end

  if chosen_emote == nil
    "Sorry, that emoticon was not found"
  else
    emoticon_hash[chosen_emote][:japanese]
  end
end


#------------------------------------------------------------------------
