#!/bin/bash

# Setup
BUILD_DIR=ldk.0.2.1
mkdir -p $BUILD_DIR
cd $BUILD_DIR

# Build static libs
for TARGET in \
        aarch64-apple-ios x86_64-apple-ios aarch64-apple-ios-sim \
        x86_64-apple-darwin aarch64-apple-darwin
do
    rustup target add $TARGET
    cargo build -r --target=$TARGET
done

# Create XCFramework zip
FRAMEWORK="ldk_node.xcframework"
LIBNAME=libldk_node.a

mkdir -p  ios-lipo

IOS_SIM_LIPO=ios-lipo/$LIBNAME



lipo -create -output $IOS_SIM_LIPO \
        ../target/aarch64-apple-ios-sim/release/$LIBNAME \
        ../target/x86_64-apple-ios/release/$LIBNAME

xcodebuild -create-xcframework \
        -library $IOS_SIM_LIPO \
        -library ../target/aarch64-apple-ios/release/$LIBNAME \
        -output $FRAMEWORK

rm -rf ios-lipo