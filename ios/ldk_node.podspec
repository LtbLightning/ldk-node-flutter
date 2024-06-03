Pod::Spec.new do |s|
  s.name             = 'ldk_node'
  s.version          = '0.2.2-dev'
  s.summary          = 'A ready-to-go Lightning node library built using LDK and BDK.'
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
        s.script_phase = {
          :name => 'Build Rust library',
          # First argument is relative path to the `rust` folder, second is name of rust library
          :script => 'sh "$PODS_TARGET_SRCROOT/../cargokit/build_pod.sh" ../rust ldk_node',
          :execution_position => :before_compile,
          :input_files => ['${BUILT_PRODUCTS_DIR}/cargokit_phony'],
          # Let XCode know that the static library referenced in -force_load below is
          # created by this build step.
          :output_files => ["${BUILT_PRODUCTS_DIR}/libldk_node.a"],
        }
        s.pod_target_xcconfig = {
          'DEFINES_MODULE' => 'YES',
          # Flutter.framework does not contain a i386 slice.
          'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
          'OTHER_LDFLAGS' => '-force_load ${BUILT_PRODUCTS_DIR}/libldk_node.a',
        }
  end
