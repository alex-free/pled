# Changelog

## v1.0.4 (3/28/2024)

[PLED v1.0.4](https://github.com/alex-free/pled/releases/download/v1.0.4/pled-v1.0.4.zip)

Changes:

*   Fixed bug where some stranger shared library paths that included some relativeness were not being copied (bug found from pleding [p7zip](https://github.com/p7zip-project/p7zip)'s 7za).

## v1.0.3 (8/15/2023)

[PLED v1.0.3](https://github.com/alex-free/pled/releases/download/v1.0.3/pled-v1.0.3.zip)

Changes:

*   Improved error handling.
*   You can now use an existing directory as the specified output directory. This way you can dump a whole bunch of programs that have be ran through pled all in one place, such as in a shared 'bin' directory within a portable release of some software toolkit.
*   Improved documentation.

## v1.0.2 (2/16/2023)

[PLED v1.0.2](https://github.com/alex-free/pled/releases/download/v1.0.2/pled-1.0.2.zip)

Changes:

*   PLED now requires 2 arguments. The first is the full executable file path or the name of a command in your `$PATH`. The second is the full path to the output `pled`.

## v1.0.1 (9/27/2022)

[PLED v1.0.1](https://github.com/alex-free/pled/releases/download/v1.0.1/pled-1.0.1.zip)

Changes:

*   Calls LD loader by explicit filepath instead of first changing to the current directory of the PLED executable and then using a relative path. This improves software compatibility and fixes 'file not found' type issues PLED v1.0 had when giving a relative path as an argument to a PLED wrapper.

## v1.0 (1/25/2022)

[PLED v1.0](https://github.com/alex-free/pled/releases/download/v1.0/pled-1.0.zip)
