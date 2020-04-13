Pod::Spec.new do |spec|
  spec.name         = "ios-segment-tool"
  spec.version      = "0.0.6"
  spec.framework    = 'XCTest'
  spec.summary      = "A short description of ios-segment-tool."
  spec.description  = "my description here"
  spec.homepage     = 'git@github.com:willowtreeapps/ios-segment-tool.git'
  spec.license      = "MIT"
  spec.author             = { "Michael Rack" => "michael.rack@willowtreeapps.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/willowtreeapps/ios-segment-tool.git"}
  spec.source_files  = "Classes", "Classes/**/*.{swift}"
end
