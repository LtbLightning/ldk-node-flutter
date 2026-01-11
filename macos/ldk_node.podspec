#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint ldk_node.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'ldk_node'
  s.version          = '0.4.2'
  s.summary          = 'A ready-to-go Lightning node library built using LDK and BDK.'
  s.homepage         = 'https://www.LtbL.io'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Let there be Lightning, Inc' => 'hello@LtbLightning.io' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.source_files     = 'Classes/**/*'
  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
  s.dependency 'FlutterMacOS'
  s.osx.deployment_target = '14.0'
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
                                'OTHER_LDFLAGS' => '-force_load ${BUILT_PRODUCTS_DIR}/libldk_node.a',
                                'DEAD_CODE_STRIPPING' => 'YES',
                                'STRIP_INSTALLED_PRODUCT[config=Release][sdk=*][arch=*]' => "YES",
                                'STRIP_STYLE[config=Release][sdk=*][arch=*]' => "non-global",
                                'DEPLOYMENT_POSTPROCESSING[config=Release][sdk=*][arch=*]' => "YES",
                            }
  s.framework        = 'SystemConfiguration'                          
  end
