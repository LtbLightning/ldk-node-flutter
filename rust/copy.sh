       if [ -d "../android/src/main/jniLibs" ]; then rm -r ../android/src/main/jniLibs
        fi
        if [ -e "../ios/librust_ldk_node.a" ]; then rm ../ios/librust_ldk_node.a
        fi

       mkdir -p ../android/src/main/jniLibs/arm64-v8a
       mkdir -p ../android/src/main/jniLibs/armeabi-v7a
       mkdir -p ../android/src/main/jniLibs/x86

       # Name the native lib 'librust_ldk_node' when copying to avoid naming conflicts with other native code libs build from rust
       cp target/aarch64-linux-android/release/librust.so  ../android/src/main/jniLibs/arm64-v8a/librust_ldk_node.so
       cp target/armv7-linux-androideabi/release/librust.so  ../android/src/main/jniLibs/armeabi-v7a/librust_ldk_node.so
       cp target/i686-linux-android/release/librust.so  ../android/src/main/jniLibs/x86/librust_ldk_node.so

       cp target/universal/release/librust.a  ../ios/librust_ldk_node.a

