ifeq ($(OS),Windows_NT)
    SHELL := pwsh.exe
else
   SHELL := pwsh
endif
.SHELLFLAGS := -NoProfile -Command 

DockerBuild := true#If true, use a docker image to run the vsce package command. Use this to toggle using docker containers 
ExtensionName := makefile-boilerplate
Publisher := Alpha1337k
version := 0.1.10

ifeq ($(DockerBuild), true)
PackagePrefix := docker run --rm -v $${PWD}:/work bmcclure89/
endif
.PHONY: all test lint clean build package
all: build package

build:
	@./BuildTools/build.ps1 -ExtensionName $(ExtensionName) -Publisher $(Publisher) -version $(version)

package:
	@If(-Not (Test-Path bin)){New-Item bin -itemType Directory -ErrorAction Ignore | Out-Null}
	@$(PackagePrefix)vsce package -o bin/$(ExtensionName)-$(version).vsix


clean:
	@./BuildTools/Clean.ps1 -ExtensionName $(ExtensionName) -Publisher $(Publisher) -version $(version)

lint: lint_mega lint_credo

lint_mega:
	docker run -v $${PWD}:/tmp/lint oxsecurity/megalinter:v6
lint_goodcheck:
	docker run -t --rm -v $${PWD}:/work sider/goodcheck check
lint_goodcheck_test:
	docker run -t --rm -v $${PWD}:/work sider/goodcheck test
lint_makefile:
	docker run -v $${PWD}:/tmp/lint -e ENABLE_LINTERS=MAKEFILE_CHECKMAKE oxsecurity/megalinter:v6
test:
	echo 'Not Implemented'