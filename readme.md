# td
Lightweight and simple TODO and FIXME finder for your code. Works for any architecture supported by the Nim compiler.

## Installation

Building from source requires a working version of the Nim programming language and its compiler on your system.

1. `git clone` this repository and `cd` to it.
2. run either `buildRelease` to create an executable in the current working directory or `installRelease` to build the executable to your nimble path.

You can also get a working copy for MacOS from the releases page.

## Usage

`td` without any arguments after recursively wanders beneath the current working directory parsing code with an appropriate extension.
You can also pass an argument to a specific file if you would like to find TODO and FIXME lines in only that one.

It currently looks for file extensions belonging to these popular formats or languages.

- Python
- C and headers
- C++ and headers
- Markdown
- Text
- Nim
- Shell
- Java
- Javascript
- Typescript
- Swift
- Visual Basic
- Supercollider and help files
- D
- Ruby
- R
- Matlab
- PHP
- html
- XML
- css
- Golang
- Perl
- Erlang
- Batch files
- Powershell

## Contributing

If you want additional file types to be supported its very simple to add them. Take a look at `validExtensions` inside the Nim file and add your own. If you do, please make a PR and I'll merge it.