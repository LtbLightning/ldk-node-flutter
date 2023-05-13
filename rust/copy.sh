       if [ -d "../android/src/main/jniLibs" ]; then rm -r ../android/src/main/jniLibs
        fi
        if [ -e "../ios/libldknode.a" ]; then rm ../ios/libldknode.a
        fi

       mkdir -p ../android/src/main/jniLibs/arm64-v8a
       mkdir -p ../android/src/main/jniLibs/armeabi-v7a
       mkdir -p ../android/src/main/jniLibs/x86

       # Name the native lib 'libldknode' when copying to avoid naming conflicts with other native code libs build from rust
       cp target/aarch64-linux-android/release/librust.so  ../android/src/main/jniLibs/arm64-v8a/libldknode.so
       cp target/armv7-linux-androideabi/release/librust.so  ../android/src/main/jniLibs/armeabi-v7a/libldknode.so
       cp target/i686-linux-android/release/librust.so  ../android/src/main/jniLibs/x86/libldknode.so

       cp target/universal/release/librust.a  ../ios/libldknode.a

