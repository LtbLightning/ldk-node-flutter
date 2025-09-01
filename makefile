.DEFAULT_GOAL := help
PROJECTNAME=$(shell basename "$(PWD)")

.PHONY: help
help: makefile
	@echo
	@echo " Available actions in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

.PHONY: init fmt codegen example android-debug android-release

## init: Install missing dependencies.
init:
	cargo install flutter_rust_bridge_codegen --version 2.11.1 --locked

## fmt: Format Rust code.
## codegen: Generate Flutter Rust Bridge code with proper environment.
## example: Run the example app with optional flags (e.g., make example -d chrome).
## android-debug: Build Android debug APK with clean environment.
## android-release: Build Android release APK with clean environment.
## :

all: init fmt codegen 
fmt:
	cd rust &&  cargo fmt --all

## codegen: Generate Flutter Rust Bridge code with proper environment
codegen:
	@echo "[GENERATING FRB CODE]"
	@if [ "$$(uname)" = "Linux" ]; then \
		echo "Setting up environment for Linux..."; \
		export CPATH="$$(clang -v 2>&1 | grep "Selected GCC installation" | rev | cut -d' ' -f1 | rev)/include" && \
		echo "CPATH set to: $$CPATH" && \
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







