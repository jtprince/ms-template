module Ms
  module Template
    VERSION = IO.readlines(File.dirname(__FILE__) + "/../../../VERSION").first.chomp
  end
end
