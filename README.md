MSYS2 (MinGW) Cygwin
===========

This is a MinGW port of [arch-cygwin][arch-cygwin] for using the Cygwin cross toolchain on MSYS2.

Currently, the packages prefixed with `mingw-w64-` are available to use.

More PKGBUILDs can be adapted for MSYS2 in the future.

## Install

> [!NOTE]
>
> Currently only building inside MINGW64 terminal is supported,
> but you can try to tweak the PKGBUILD files and build under another environment, which is untested.
>
> You can try to follow the [Bootstrapping](#bootstrapping) instructions to build the cross compilers yourself.
>
> Please feel free to open an [Issue](../../issues) if you run into any problem.

All packages are precompiled and available for downloading at [GitHub Releases](../../releases),

to use them, add the following lines to the end of your `/etc/pacman.conf` (note pkgs are currently not signed) and sync the database using `pacman -Syu`:

```text
[msys2-cygwin]
SigLevel = Optional
Server = https://github.com/ookiineko-cygport/msys2-cygwin/releases/download/snapshot-msys2
```

Then you should be able to install packages like this: `pacman -S mingw-w64-x86_64-cygwin-gcc`

### Building

> [!IMPORTANT]
>
> Parallel builds might break things sometimes, use a single job to be safe.
>
> You can do this by editing your `/etc/makepkg_mingw.conf` and remove `-jXX` from `MAKEFLAGS` (if any).

First, clone this repository using Git and make sure you have installed `base-devel` package group from MSYS2 repository before proceeding.

And then simply run `makepkg-mingw -si` in a subdirectory in order to build and install that package.

#### Bootstrapping

When bootstrapping the cross compilers, build and install the following packages one by one, and in this order:

  * mingw-w64-cygwin-binutils
  * mingw-w64-cygwin-default-manifest-bin
  * mingw-w64-cygwin-w32api-headers
  * mingw-w64-cygwin-w32api-runtime-bin
  * mingw-w64-cygwin-bin
  * mingw-w64-cygwin-gcc
  * mingw-w64-cygwin-default-manifest (replaces the `-bin` one)
  * mingw-w64-cygwin-w32api-runtime (replaces the `-bin` one)
  * mingw-w64-cygwin (replaces the `-bin` one; requires `mingw-w64-cocom` to build)
  * mingw-w64-cygwin-gcc (rebuild to link against our just-built libraries)

After that other packages can be built and installed normally ;)

##### See also

[Cygwin cross compilers on archlinux (unofficial)](https://github.com/ookiineko/arch-cygwin.git)

[Cygwin documentation: Building a cross-compiler](https://x.cygwin.com/docs/cg/cross.html)

[Cygwin cross-compilers on Ubuntu / Debian (unofficial)](https://github.com/ookiineko-cygport/deb-cygwin.git)

## Contributing

Please refer to [ArchWiki: MinGW package guidelines](https://wiki.archlinux.org/title/MinGW_package_guidelines).

## Credits

Special thanks to the following external sources where arch-cygwin took references or borrowed code from (unsorted):

  * [cygwin-packages](https://cygwin.com/cgit/cygwin-packages) (For Cygwin quirks and patches!)

  * [MinGW-w64 packages on AUR](https://aur.archlinux.org/packages?K=mingw-w64) (For various kinds of wrappers, and packaging rules!)

  * [msys2/MINGW-packages](https://github.com/msys2/MINGW-packages) (For various MinGW patches, LLVM build and other quirks)

  * [Fedora Cygwin](https://copr.fedorainfracloud.org/coprs/yselkowitz/cygwin/) (For Cygwin quirks when cross compiling)

  * [archlinux packaging](https://gitlab.archlinux.org/archlinux/packaging/packages)

  * [yselkowitz's Fedora GIT](https://fedorapeople.org/cgit/yselkowitz/)

<!-- References: -->
[arch-cygwin]: https://github.com/ookiineko/arch-cygwin.git
