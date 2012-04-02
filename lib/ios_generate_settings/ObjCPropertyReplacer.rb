class ObjCPropertyReplacer
  attr_accessor :input_file
  attr_accessor :output_file
  attr_accessor :buffer

  def initialize(input, output)
    self.buffer = nil
    self.input_file = input
    self.output_file = output
  end

  def replace(src, dst)
    self.buffer = self.input_buffer
    self.buffer = self.buffer.gsub(src, "#{src}\n#{dst}")
  end

  def flush
    file = File.open(self.output_file, 'w')
    file.write self.buffer
    file.close
  end

  def input_buffer
    if self.buffer
      return self.buffer
    end
    path = self.input_file
    if File.exists? self.output_file
      path = self.output_file
    end
    File.read path
  end

end
