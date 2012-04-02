require 'ios_generate_settings/ObjCProperty'
class ObjCPropertyList
  attr_accessor :properties

  def initialize(args)
    self.properties = []
    args.each do | arg |
      args = arg.split ':'
      if args.count == 2
        property = ObjCProperty.new(args[1], args[0])
        self.properties << property
      end
    end
  end

  def implementation
    self.properties.map do | property |
      "#{property.implementation}\n"
    end.join ''
  end

  def declaration
    self.properties.map do | property |
      "#{property.declaration}\n"
    end.join ''
  end

  def string_const
    self.properties.map do | property |
      "#{property.string_const}\n"
    end.join ''
  end

  def loading
    self.properties.map do | property |
      "#{' '*8}#{property.loading}\n"
    end.join ''
  end

  def release
    self.properties.map do | property |
      "#{' '*4}#{property.release}\n"
    end.join ''
  end

  def print
    printf self.string_const
    printf self.declaration
    printf self.implementation
    printf self.loading
  end

end
