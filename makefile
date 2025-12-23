.DEFAULT_GOAL := help
PROJECTNAME=$(shell basename "$(PWD)")

.PHONY: help
help: makefile
	@echo
	@echo " Available actions in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

.PHONY: init fmt codegen example android-debug android-release android-run ios-debug ios-release ios-run clean

## init: Install missing dependencies.
init:
	cargo install flutter_rust_bridge_codegen --version 2.11.1 --locked
	cargo install --force --locked bindgen-cli

## fmt: Format Rust code.
fmt:
	cd rust &&  cargo fmt --all

## all: Initialize, format, and generate code.
all: init fmt codegen 

## codegen: Generate Flutter Rust Bridge code with proper environment
codegen:
	@echo "[GENERATING FRB CODE]"
	@if [ "$$(uname)" = "Linux" ]; then \
		echo "Setting up environment for Linux..."; \
		export CPATH="$$(clang -v 2>&1 | grep "Selected GCC installation" | rev | cut -d' ' -f1 | rev)/include" && \
		echo "CPATH set to: $$CPATH" && \
		flutter_rust_bridge_codegen generate; \
	elif [ "$$(uname)" = "Darwin" ]; then \
		echo "Setting up environment for macOS..."; \
		export CPATH="$$(xcrun --show-sdk-path)/usr/include"; \
		export LIBRARY_PATH="$$(xcrun --show-sdk-path)/usr/lib"; \
		export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"; \
		export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"; \
		echo "SDK path: $$(xcrun --show-sdk-path)"; \
		flutter_rust_bridge_codegen generate; \
	else \
		echo "Running on $$(uname)..."; \
		flutter_rust_bridge_codegen generate; \
	fi
	@echo "[Done ✅]"

## example: Run the example app with optional flags
example:
	@echo "[RUNNING EXAMPLE APP]"
	@if [ "$$(uname)" = "Linux" ]; then \
		echo "Clearing problematic environment variables on Linux..."; \
		unset CPATH CPLUS_INCLUDE_PATH C_INCLUDE_PATH && cd example && flutter run $(filter-out $@,$(MAKECMDGOALS)); \
	else \
		echo "Running on $$(uname)..."; \
		cd example && flutter run $(filter-out $@,$(MAKECMDGOALS)); \
	fi

# This prevents make from trying to run the flags as targets
%:
	@:

## android-debug: Build Android debug APK with clean environment
android-debug:
	@echo "[BUILDING ANDROID APK]"
	@if [ "$$(uname)" = "Linux" ]; then \
		echo "Clearing problematic environment variables on Linux..."; \
		unset CPATH CPLUS_INCLUDE_PATH C_INCLUDE_PATH && cd example && flutter build apk --debug; \
	else \
		echo "Building on $$(uname)..."; \
		cd example && flutter build apk --debug; \
	fi
	@echo "[Android APK build complete ✅]"

## android-release: Build Android release APK with clean environment  
android-release:
	@echo "[BUILDING ANDROID RELEASE APK]"
	@if [ "$$(uname)" = "Linux" ]; then \
		echo "Clearing problematic environment variables on Linux..."; \
		unset CPATH CPLUS_INCLUDE_PATH C_INCLUDE_PATH && cd example && flutter build apk --release; \
	else \
		echo "Building on $$(uname)..."; \
		cd example && flutter build apk --release; \
	fi
	@echo "[Android release APK build complete ✅]"

## android-run: Run Android app with optional device and other flutter run flags
android-run:
	@echo "[RUNNING ANDROID APP]"
	@if [ "$$(uname)" = "Linux" ]; then \
		echo "Clearing problematic environment variables on Linux..."; \
		unset CPATH CPLUS_INCLUDE_PATH C_INCLUDE_PATH && cd example && flutter run $(filter-out $@,$(MAKECMDGOALS)); \
	else \
		echo "Running on $$(uname)..."; \
		cd example && flutter run $(filter-out $@,$(MAKECMDGOALS)); \
	fi
	@echo "[Android app run complete ✅]"

## ios-debug: Build iOS debug app with proper environment setup
ios-debug:
	@echo "[BUILDING IOS DEBUG APP]"
	@echo "Setting up iOS build environment..."
	@export CARGO_CFG_TARGET_OS=ios && \
	export CARGO_CFG_TARGET_ARCH=aarch64 && \
	export IPHONEOS_DEPLOYMENT_TARGET=12.0 && \
	export BINDGEN_EXTRA_CLANG_ARGS="-isysroot $$(xcrun --show-sdk-path) -I$$(xcrun --show-sdk-path)/usr/include" && \
	export CMAKE_SYSTEM_NAME=iOS && \
	export CMAKE_OSX_ARCHITECTURES=arm64 && \
	export CMAKE_OSX_DEPLOYMENT_TARGET=12.0 && \
	export CC_aarch64_apple_ios="$$(xcrun --find clang)" && \
	export CXX_aarch64_apple_ios="$$(xcrun --find clang++)" && \
	export AR_aarch64_apple_ios="$$(xcrun --find ar)" && \
	cd example && flutter build ios --debug --simulator --verbose
	@echo "[iOS debug build complete ✅]"

## ios-release: Build iOS release app with proper environment setup
ios-release:
	@echo "[BUILDING IOS RELEASE APP]"
	@echo "Setting up iOS build environment..."
	@export CARGO_CFG_TARGET_OS=ios && \
	export CARGO_CFG_TARGET_ARCH=aarch64 && \
	export IPHONEOS_DEPLOYMENT_TARGET=12.0 && \
	export BINDGEN_EXTRA_CLANG_ARGS="-isysroot $$(xcrun --show-sdk-path) -I$$(xcrun --show-sdk-path)/usr/include" && \
	export CMAKE_SYSTEM_NAME=iOS && \
	export CMAKE_OSX_ARCHITECTURES=arm64 && \
	export CMAKE_OSX_DEPLOYMENT_TARGET=12.0 && \
	export CC_aarch64_apple_ios="$$(xcrun --find clang)" && \
	export CXX_aarch64_apple_ios="$$(xcrun --find clang++)" && \
	export AR_aarch64_apple_ios="$$(xcrun --find ar)" && \
	cd example && flutter build ios --release
	@echo "[iOS release build complete ✅]"

## ios-run: Run iOS app with optional device and other flutter run flags
ios-run:
	@echo "[RUNNING IOS APP]"
	@echo "Setting up iOS run environment..."
	@export CARGO_CFG_TARGET_OS=ios && \
	export CARGO_CFG_TARGET_ARCH=aarch64 && \
	export IPHONEOS_DEPLOYMENT_TARGET=12.0 && \
	export BINDGEN_EXTRA_CLANG_ARGS="-isysroot $$(xcrun --show-sdk-path) -I$$(xcrun --show-sdk-path)/usr/include" && \
	export CMAKE_SYSTEM_NAME=iOS && \
	export CMAKE_OSX_ARCHITECTURES=arm64 && \
	export CMAKE_OSX_DEPLOYMENT_TARGET=12.0 && \
	export CC_aarch64_apple_ios="$$(xcrun --find clang)" && \
	export CXX_aarch64_apple_ios="$$(xcrun --find clang++)" && \
	export AR_aarch64_apple_ios="$$(xcrun --find ar)" && \
	cd example && flutter run $(filter-out $@,$(MAKECMDGOALS))
	@echo "[iOS app run complete ✅]"

## clean: Clean build artifacts and caches
clean:
	@echo "[CLEANING BUILD ARTIFACTS]"
	@echo "Cleaning Rust target directory..."
	@cd rust && cargo clean
	@echo "Cleaning Flutter build cache..."
	@cd example && flutter clean
	@echo "Cleaning iOS build cache..."
	@if [ -d "example/ios/build" ]; then rm -rf example/ios/build; fi
	@if [ -d "example/build" ]; then rm -rf example/build; fi
	@echo "Cleaning Pods cache..."
	@if [ -d "example/ios/Pods" ]; then rm -rf example/ios/Pods; fi
	@if [ -f "example/ios/Podfile.lock" ]; then rm example/ios/Podfile.lock; fi
	@echo "[Clean complete ✅]"
