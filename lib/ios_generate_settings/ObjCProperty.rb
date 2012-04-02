class ObjCProperty
  attr_accessor :type # NSString, NSNumber, etc.
  attr_accessor :name # accessor, like 'login', 'password'
  attr_accessor :writeability # readonly, readwrite, :default => readwrite
  attr_accessor :setter_semantic # assign, copy, retain, :default => retain
  attr_accessor :atomicity # atomic, nonatomic, :default => nonatomic

  def initialize(type, name, writeability = :readwrite, setter_semantic = :retain, atomicity = :nonatomic)
    self.type = type
    self.name = name
    self.setter_semantic = setter_semantic
    self.writeability = writeability
    self.atomicity = atomicity
  end

  def print
    puts "static NSString *const k#{name.capitalize} = @\"#{name}\";"
    puts "@property (#{atomicity}, #{setter_semantic}, #{writeability}) #{type} *#{name};"
    puts "@synthesize #{name};"
  end

  def declaration
    "@property (#{atomicity}, #{setter_semantic}, #{writeability}) #{type} *#{name};"
  end
  def implementation
    "@synthesize #{name};"
  end
  def string_const
    "static NSString *const k#{name.capitalize} = @\"#{name}\";"
  end
  # NSUserDefaults *defaults = [NSUserDefaults stndardUserdefaults];
  def loading
    "self.#{name} = [defaults valueForKey:k#{name.capitalize}];"
  end
  def release
    if setter_semantic.to_s == "assign"
      ""
    else
      "self.#{name} = nil;"
    end
  end

end
