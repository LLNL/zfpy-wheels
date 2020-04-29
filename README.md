# zfp-wheels : Building and uploading zfpy wheels #

## What it is ##

Repository for wheel building of zfpy, the official Python bindings for the zfp compression algorithm.
- [zfp homepage](https://computing.llnl.gov/projects/floating-point-compression)
- [zfp on github](https://github.com/LLNL/zfp)

## What it does ##

When triggered on Travis, this repository:
- Fetches a specific tag/commit from the main zfp repository
- Clones the [multibuild repository](https://github.com/matthew-brett/multibuild)
- Builds zfp, using the options for building the Python bindings
- Uses scripts from the multibuild repository to:
  - Build wheels for various environments
  - Delocalize the wheels (bundle libzfp.so into them)
- Uploads the wheels to PyPI, using an encrypted API token.
 
