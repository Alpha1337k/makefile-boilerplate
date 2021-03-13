ifeq ($(OS),Windows_NT)
    SHELL := pwsh.exe
else
   SHELL := pwsh
endif
.SHELLFLAGS := -NoProfile -Command 

ExtensionName := makefile-boilerplate
Publisher := Alpha1337k
version := 0.1.1

.PHONY: clean build 
all: build

build:
	@./BuildTools/build.ps1 -ExtensionName $(ExtensionName) -Publisher $(Publisher) -version $(version)

package:
	@If(-Not (Test-Path bin)){New-Item bin -itemType Directory -ErrorAction Ignore | Out-Null}
	@docker run --rm -v $${PWD}:/work bmcclure89/vsce package -o bin/$(ExtensionName)-$(version).vsix

clean:
	@./BuildTools/Clean.ps1 -ExtensionName $(ExtensionName) -Publisher $(Publisher) -version $(version)
