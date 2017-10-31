require 'yaml'

class IOUtility

  @@LANG = "en"

  def initialize(translations)
    @translations = YAML.load_file(translations)
  end

  def print(key)
    @translations[@@LANG][key]
  end

end
