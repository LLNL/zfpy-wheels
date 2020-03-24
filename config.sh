# Define custom utilities
# Test for macOS with [ -n "$IS_OSX" ]

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    mkdir build
    pushd build
    which python
    NUMPY_INCLUDE=$($PYTHON_EXE -c "import numpy; print(numpy.get_include())")
    cmake .. -DBUILD_ZFPY=ON -DPYTHON_NUMPY_INCLUDE_DIR=$NUMPY_INCLUDE
    make
    popd
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    # python -c 'import sys; import yourpackage; sys.exit(yourpackage.test())'
}