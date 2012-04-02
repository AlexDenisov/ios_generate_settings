Gem::Specification.new do |s|
    s.name        = 'ios_generate_settings'
    s.version     = '0.0.1'
    s.date        = '2012-04-02'
    s.executables << 'ios_generate_settings'
    s.summary     = "Create SettingsManager class"
    s.description = "Comand line interface to create SettingsManager singleton"
    s.authors     = ["Alex Denisov"]
    s.email       = '1101.debian@gmail.com'
    s.files       = ["lib/ios_generate_settings.rb",
                     "lib/ios_generate_settings/ObjCPropertyList.rb",
                     "lib/ios_generate_settings/ObjCPropertyReplacer.rb",
                     "lib/ios_generate_settings/ObjCProperty.rb",
                     "lib/ios_generate_settings/templates/SettingsManager.h.template",
                     "lib/ios_generate_settings/templates/SettingsManager.m.template"]
    s.homepage    = "https://github.com/AlexDenisov/ios_generate_settings"
end
