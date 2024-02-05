#!/bin/bash



export_variable_if_not_present() {
  local name="$1"
  local value="$2"

  # Check if the variable is already set
  if [ -z "${!name}" ]; then
    export "$name=$value"
    echo "Exported $name=$value"
  else
    echo "$name is already set to ${!name}, not exporting."
  fi
}

case "$OSTYPE" in
    linux-gnu)
      export_variable_if_not_present "ANDROID_NDK_ROOT" "/opt/android-ndk"
      export_variable_if_not_present "LLVM_ARCH_PATH" "linux-x86_64"
      ;;
    darwin*)
      export_variable_if_not_present "ANDROID_NDK_ROOT" "/opt/homebrew/share/android-ndk"
      export_variable_if_not_present "LLVM_ARCH_PATH" "darwin-x86_64"
      ;;
    *)
      echo "Unknown operating system: $OSTYPE"
      ;;
    esac

PATH="$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/$LLVM_ARCH_PATH/bin:$PATH"

rustup target add x86_64-linux-android aarch64-linux-android armv7-linux-androideabi i686-linux-android
CFLAGS="-D__ANDROID_MIN_SDK_VERSION__=21" AR=llvm-ar CARGO_TARGET_X86_64_LINUX_ANDROID_LINKER="x86_64-linux-android21-clang" CC="x86_64-linux-android21-clang" cargo build --release --target x86_64-linux-android || exit 1
CFLAGS="-D__ANDROID_MIN_SDK_VERSION__=21" AR=llvm-ar CARGO_TARGET_ARMV7_LINUX_ANDROIDEABI_LINKER="armv7a-linux-androideabi21-clang" CC="armv7a-linux-androideabi21-clang" cargo build --release --target armv7-linux-androideabi || exit 1
CFLAGS="-D__ANDROID_MIN_SDK_VERSION__=21" AR=llvm-ar CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER="aarch64-linux-android21-clang" CC="aarch64-linux-android21-clang" cargo build --release --target aarch64-linux-android || exit 1
CFLAGS="-D__ANDROID_MIN_SDK_VERSION__=21" AR=llvm-ar CARGO_TARGET_I686_LINUX_ANDROID_LINKER="i686-linux-android21-clang" CC="i686-linux-android21-clang" cargo build --release --target i686-linux-android || exit 1
