Pod::Spec.new do |s|
  s.name             = 'ldk_node'
  s.version          = '0.2.1'
  s.summary          = 'A ready-to-go Lightning node library built using LDK and BDK.'
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.swift_version = '5.0'
  s.public_header_files = 'Classes**/*.h'
  s.source_files = 'Classes/**/*'
  s.preserve_paths = 'ldk_node.xcframework/**/*'
  s.vendored_frameworks = 'ldk_node.xcframework'
end
