# makefile-boilerplate

Tired of repetative Makefile creation? Fear no more! this extention eases your pain!

## Features

Creates an boilerplate Makefile using VSCode snippets. More snippets will be added, but feel free to help.

## Usage

* `!make_c`: creates an C boilerplate function
* `!make_cpp`: creates an C++ boilerplate function
* `!make_cs`: creates an C# boilerplate function
* `!make_nasm`: creates an Assembly boilerplate function
* `!make_shell_pwsh`: Sets the default shell to run pwsh.exe on windows, and pwsh on others
* `!make_elixir`: setup dev postgres, get dependencies, and run Elixir apps (specifically Pheonix) locally.
* `!make_docker-compose`: boilerplate for running docker-compose files. Uses pwsh core build scripts/shell scripting
* `!make_docker_image`: boilerplate for building, packaging, publishing Dockerfiles/images. uses pwsh core build scripts/shell scripting
* `!make_helm_charts`: boilerplate for working with a directory of individual helm charts. uses pwsh core build scripts/shell scripting
* `!make_generic_lint`: Add targets to give you generic linting. run `make lint_makefile` after adding this to lint your makefile!

## To build

you will need `git` and `make`, `docker` and `pwsh core` to run these build steps.

`git clone https://github.com/Alpha1337k/makefile-boilerplate.git`
`cd makefile-boilerplate`

Adjust the version in the Makefile, then
`make build package`
which will produce a `.vsix` you can install

-----------------------------------------------------------------------------------------------------------

enjoy!
