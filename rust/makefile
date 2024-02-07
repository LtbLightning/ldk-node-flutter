.DEFAULT_GOAL := help
PROJECTNAME=$(shell basename "$(PWD)")
.PHONY: help
help: makefile
	@echo
	@echo " Available actions in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

init:
	cargo install flutter_rust_bridge_codegen
	@if [ $$(uname) == "Darwin" ] ; then cargo install cargo-lipo ; fi

all: init build-jnilib build-ios copy-build

build-jnilib:
	  @echo "[Creating android jniLibs ...] $@"
	  sh android.sh
	  @echo "[Done ✅]"

build-ios:
	  @echo "[Creating libldknode.a ...] $@"
	  cargo lipo --release
	  @echo "[Done ✅]"

copy-build:
	@echo "[COPYING BINARIES TO FLUTTER PACKAGE ...] $@"
	sh copy.sh
	@echo "[Done ✅]"







