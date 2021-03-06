#
# Be sure to run `pod lib lint Swifixture.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Swifixture"
  s.version          = "0.1.1"
  s.summary          = "Swift library to load Json fixtures."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = <<-DESC
  Swift library to load Json fixtures. Swift version of my other library to load json
  written in objective-c. https://github.com/thiagolioy/TLJsonFactory
                       DESC

  s.homepage         = "https://github.com/thiagolioy/Swifixture"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Thiago Lioy" => "thiagolioy@gmail.com" }
  s.source           = { :git => "https://github.com/thiagolioy/Swifixture.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/tplioy'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Swifixture' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SwiftyJSON'
  s.dependency 'ObjectMapper'
end
