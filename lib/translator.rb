require 'yaml'


def load_library(path)
  emoticons = YAML.load_file(path)
  new_hash = {}

  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}

  emoticons. each do |word, emoticon_hash|
    new_hash["get_emoticon"][emoticon_hash.first] = emoticon_hash.last
    new_hash["get_meaning"][emoticon_hash.last] = word
  end
  new_hash
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  the_emotiocon_result = hash["get_emoticon"][emoticon]
  if the_emotiocon_result == nil
    the_emotiocon_result = "Sorry, that emoticon was not found"
  end
  the_emotiocon_result
end

def get_english_meaning(path, emoticon)
  hash = load_library(path)

  result = hash["get_meaning"][emoticon]

  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result 
end
