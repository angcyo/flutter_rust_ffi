#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_rust_ffi.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_rust_ffi'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter rust ffi project.'
  s.description      = <<-DESC
A new Flutter rust ffi project.
                       DESC
  s.homepage         = 'http://github.com/angcyo'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'angcyo' => 'angcyo@126.com' }

  # This will ensure the source files in Classes/ are included in the native
  # builds of apps using this FFI plugin. Podspec does not support relative
  # paths, so Classes contains a forwarder C file that relatively imports
  # `../src/*` so that the C sources can be shared among all target platforms.
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  #s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'OTHER_LDFLAGS' => '-lc++ -force_load ${PODS_TARGET_SRCROOT}/librust_api_test.a'
  }
  #s.vendored_libraries = 'librust_api_test.a'

  s.vendored_libraries = 'librust_api_test.a', 'librust_api_test2.dylib'
  s.vendored_frameworks = 'rust_api_test2.xcframework'
end
