.DEFAULT_GOAL := help
PROJECTNAME=$(shell basename "$(PWD)")

.PHONY: help
help: makefile
	@echo
	@echo " Available actions in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

## init: Install missing dependencies.
init:
	cargo install flutter_rust_bridge_codegen --version 2.6.0
## :

all: init fmt codegen 
fmt:
	cd rust &&  cargo fmt --all
codegen:
	@echo "[GENERATING FRB CODE] $@"
	flutter_rust_bridge_codegen generate
	@echo "[Done ✅]"







