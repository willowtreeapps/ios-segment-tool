Pod::Spec.new do |spec|
  spec.name         = "ios-segment-tool"
  spec.version      = "0.0.8"
  spec.framework    = 'XCTest'
  spec.summary      = "A tool to help with automated verificaiton of segement events"
  spec.homepage     = 'http://github.com/willowtreeapps/ios-segment-tool.git'
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Michael Rack" => "michael.rack@willowtreeapps.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/willowtreeapps/ios-segment-tool.git", :tag => spec.version.to_s }
  spec.source_files  = "Classes", "Classes/**/*.{swift}"
  spec.swift_version = "5.0"
end
