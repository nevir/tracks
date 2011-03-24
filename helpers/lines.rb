class << self
  def uncomment_line(path, line)
    gsub_file path, Regexp.new("#\s*(#{line})"), '\1'
  end
end
