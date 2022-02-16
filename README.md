# zfp-wheels : Building and uploading zfpy wheels #

## What it is ##

Repository for wheel building of zfpy, the official Python bindings for the zfp compression algorithm.
- [zfp homepage](https://computing.llnl.gov/projects/floating-point-compression)
- [zfp on github](https://github.com/LLNL/zfp)

## What it does ##

When the Github Actions workflow is triggered, this repository:
- Fetches a specific tag/commit from the main zfp repository
- Uses cibuildwheel to:
  - Build zfp on various platforms, using the options for building the Python bindings
  - Delocalize the resulting wheels (bundle libzfp.so into them)
- Uploads the wheels to PyPI, using an API token stored as a repository secret.
