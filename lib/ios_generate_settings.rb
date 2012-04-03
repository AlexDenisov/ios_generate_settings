require 'ios_generate_settings/ObjCPropertyList'
require 'ios_generate_settings/ObjCPropertyReplacer'

class IOSGenerateSettings
  attr_accessor :header
  attr_accessor :source
  attr_accessor :template_header
  attr_accessor :template_source
  attr_accessor :source_replacer
  attr_accessor :header_replacer
  attr_accessor :property_list

  def initialize(args)
    if args.count == 0
      usage
    else
      self.header = "SettingsManager.h"
      self.source = "SettingsManager.m"
      template_path = File.expand_path(File.join(File.dirname(__FILE__), 'ios_generate_settings/templates'))
      self.template_source = File.join(template_path, 'SettingsManager.m.template')
      self.template_header = File.join(template_path, 'SettingsManager.h.template')
      self.source_replacer = ObjCPropertyReplacer.new self.template_source, self.source
      self.header_replacer = ObjCPropertyReplacer.new self.template_header, self.header
      self.property_list = ObjCPropertyList.new args
    end
  end
  def generate
    self.header_replacer.replace("//string_constants", self.property_list.string_const)
    self.header_replacer.replace("//property_declaration", self.property_list.declaration)
    self.header_replacer.flush

    self.source_replacer.replace("//property_implementation", self.property_list.implementation)
    self.source_replacer.replace("//load_properties", self.property_list.loading)
    self.source_replacer.replace("//release_properties", self.property_list.release)
    self.source_replacer.flush
  end

  def usage
    puts "Usage:"
    puts "\tios_generate_settings name:type"
    puts "Example:"
    puts "\tios_generate_settings name:NSString count:NSNumber"
    exit 1
  end
end

