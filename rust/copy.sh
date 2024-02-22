       if [ -d "../android/src/main/jniLibs" ]; then rm -r ../android/src/main/jniLibs
        fi
        if [ -e "../ios/libldknode.a" ]; then rm ../ios/libldknode.a
        fi

       mkdir -p ../android/src/main/jniLibs/arm64-v8a
       mkdir -p ../android/src/main/jniLibs/armeabi-v7a
       mkdir -p ../android/src/main/jniLibs/x86
       mkdir -p ../android/src/main/jniLibs/x86_64

       cp target/aarch64-linux-android/release/libldknode.so  ../android/src/main/jniLibs/arm64-v8a
       cp target/armv7-linux-androideabi/release/libldknode.so  ../android/src/main/jniLibs/armeabi-v7a
       cp target/i686-linux-android/release/libldknode.so  ../android/src/main/jniLibs/x86
       cp target/x86_64-linux-android/release/libldknode.so  ../android/src/main/jniLibs/x86_64

       cp target/universal/release/libldknode.a  ../ios/

