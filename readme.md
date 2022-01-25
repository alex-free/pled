# [alex-free.github.io](https://alex-free.github.io)

# Portable Linux Executable Directory (PLED)

By Alex Free

PLED is designed to make releasing Linux software easy and accessable. PLED
makes a Linux executable run on any Linux distribution with the same
architecture by creating a directory containing all linked shared libraries,
the LD loader itself, and a wrapper which executes the real Linux executable
with the included LD loader and shared libraries.

[Homepage](https://alex-free.github.io/pled) |
[GitHub](https://github.com/alex-free/pled)

## Table Of Contents

  * Downloads
  * Usage
  * License

![pled ffplay](pled.png)

## Downloads

### v1.0 - 1/25/2022

[PLED v1.0](https://github.com/alex-free/pled/releases/download/v1.0/pled-1.0.zip)

Using git:

    
    
    git clone https://github.com/alex-free/pled

View [all releases](https://github.com/alex-free/pled/releases/).

## Usage

PLED accepts only one argument. This can be an absolute file path to an
executable, or simply the name of the executable in your `$PATH`. Examples:

    
    
    ./pled git
    
    
    ./pled /usr/bin/git

Both examples above achive the same thing, a `git-pled` directory created in
the current directory that you executed PLED in. You can copy this directory
to any file path on your system, or even a different installation or Linux
distribution entirely and the `git` inside the `git-pled` directory will work.
The `git-pled` directory contains 3 things:

  * The `git` executable itself, however it is renamed to `git2` in the `git-pled` directory.
  * The `git` wrapper generated by PLED which executes `git2` with the ld loader and shared libraries in the `git-pled` directory.
  * The `git-ldd` script, which correctly displays the shared library linkage of the `git` PLED wrapper.

PLED requires an actual executable. Some software installed by your package
manager may actually be a shell script wrapper, but be presented as the
executable. PLED will refuse to function on such a shell script wrapper, as it
checks if the given 1st argument is an actual executable. Instead, PLED will
offer to display the shell script wrapper's contents to help you figure out
where the real executable is. This is a good start, but typically it may be
easier to just compile the target software yourself, figure out the
configuration and any required files yourself, and then go from there.

PLED doesn't know about any external configuration or data files the
executable may need to run. Also, some executables may load dynamic libraries
at run time **without explicitly linking them** , like how
[Firefox](https://bugs.launchpad.net/ubuntu/+source/firefox/+bug/1017964) does
by reading the external file dependentlibs.list.

One way you can debug a program in regards to required external files is by
using [Strace](https://strace.io/) (the Linux syscall tracer). In the `*-pled`
directory you can compare the output of `strace ./yourbinary` and `strace
./yourbinary2` (the actual executable the wrapper executes).

PLED will generate a `*-ldd` file in your `*-pled` directory. This is the
equivelent of the `ldd` command, but unlike the standard `ldd` command it will
accurately output shared library linkage of the PLED wrapper,

## License

PLED is released into the public domain, see the file `unlicense.txt` for more
info.

