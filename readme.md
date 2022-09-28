PLED 

[alex-free.github.io](https://alex-free.github.io)
==================================================

PortableLinuxExecutableDirectory (a.k.a. PLED)
==============================================

By Alex Free

PLED brings 'Windows-like software portability' to Linux. On Windows it is common for software to be distributed in this way:

*   The executable file (`.exe`) of the actual program is in a directory.
*   All dynamic library files (`.dll`'s) needed to run the executable file are also found in the same directory as the executable.
*   The Windows linker searches the directory that the executable file is in for the dynamic libraries it needs to run, finds them in the directory, and the executable loads with them.

This behavior is very desirable an OS such as Linux. Packaging software for Linux can become a nightmare quickly if dynamic libraries are involved (which they almost always are unless your executable is truely statically linked). PLED is designed to make releasing Linux software easy and accessable by bringing the same Windows behavior/ideals to Linux. The PLED version of a Linux executable should run on any Linux distribution with the same architecture because it is a directory containing all linked shared libraries, the LD loader itself used by the OS to load the dynamic libraries, and a wrapper which executes the real original Linux executable using the included LD loader and self-contained shared libraries all in the same directory.

[Homepage](https://alex-free.github.io/pled) | [GitHub](https://github.com/alex-free/pled)

Table Of Contents
-----------------

*   [Downloads](#downloads)
*   [Usage](#usage)
*   [License](#license)

![pled ffplay](pled.png)

Downloads
---------

### v1.0.1 (9/27/2022)

[PLED v1.0.1](https://github.com/alex-free/pled/releases/download/v1.0.1/pled-1.0.1.zip)

Changes:

*   Calls LD loader by explicit filepath instead of first changing to the current directory of the PLED executable and then using a relative path. This improves software compatibility and fixes 'file not found' type issues PLED v1.0 had when giving a relative path as an argument to a PLED wrapper.

### v1.0 (1/25/2022)

[PLED v1.0](https://github.com/alex-free/pled/releases/download/v1.0/pled-1.0.zip)

Usage
-----

PLED accepts only one argument. This can be an absolute file path to an executable, or simply the name of the executable **if it is in your `$PATH`**. Examples:

    ./pled git

    ./pled /usr/bin/git

Both examples above achive the same thing, a `git-pled` directory created in the same directory that you executed PLED inside of. You can copy this directory to any file path location on your system, or even on an different Linux installation or distribution entirely and the `git` inside the `git-pled` directory will work as it is now portable, not depending on any external dependencies from the system to be installed. The `git-pled` directory contains 3 things:

*   The `git` executable itself, however it is renamed to `git2` in the `git-pled` directory.
*   The `git` wrapper generated by PLED which executes `git2` with the ld loader and shared libraries in the `git-pled` directory.
*   The `git-ldd` script, which correctly displays the shared library linkage of the `git` PLED wrapper.

It is important to note that PLED **requires an actual executable file as the first argument and NOT a shell-script wrapper**. Some software installed by your package manager may actually be a shell script wrapper, but be presented as the executable. PLED will refuse to function on such a shell script wrapper, as it verifies if the first argument is an actual executable file. If PLED finds this not to be the case, it will helpfully offer to display the shell script wrapper's contents to help you figure out where the real executable is. This is a good start, but typically it may be easier to just recompile the target software entirely yourself, figure out the configuration and any required external files, and then go from there. Another important thing to keep in mind is that PLED doesn't know about any external configuration or data files the executable may need to run. Also, some executables may load dynamic libraries at run time **without explicitly linking them**, like how [Firefox](https://bugs.launchpad.net/ubuntu/+source/firefox/+bug/1017964) does by reading the external file dependentlibs.list.

One way you can debug a program in regards to required external files is by using [Strace](https://strace.io/) (the Linux syscall tracer). In the `*-pled` directory you can compare the output of `strace ./yourbinary` and `strace ./yourbinary2` (the actual executable the wrapper executes).

License
-------

PLED is released into the public domain, see the file `unlicense.txt` for more info.