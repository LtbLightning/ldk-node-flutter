       if [ -d "../android/src/main/jniLibs" ]; then rm -r ../android/src/main/jniLibs
        fi
        if [ -d "../ios/ldk_node.xcframework" ]; then rm -r ../ios/ldk_node.xcframework
        fi

       mkdir -p ../android/src/main/jniLibs/arm64-v8a
       mkdir -p ../android/src/main/jniLibs/armeabi-v7a
       mkdir -p ../android/src/main/jniLibs/x86
       mkdir -p ../android/src/main/jniLibs/x86_64

       cp target/aarch64-linux-android/release/libldk_node.so  ../android/src/main/jniLibs/arm64-v8a
       cp target/armv7-linux-androideabi/release/libldk_node.so  ../android/src/main/jniLibs/armeabi-v7a
       cp target/i686-linux-android/release/libldk_node.so  ../android/src/main/jniLibs/x86
       cp target/x86_64-linux-android/release/libldk_node.so  ../android/src/main/jniLibs/x86_64

       cp -r ldk.0.2.1/ldk_node.xcframework  ../ios/

