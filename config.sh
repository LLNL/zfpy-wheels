# Define custom utilities
# Test for macOS with [ -n "$IS_OSX" ]

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.

    $PYTHON_EXE -m pip install numpy cython scikit-build "cmake<3.14"
    PYTHON_LIB=$($PYTHON_EXE -c "from distutils import sysconfig; print(sysconfig.get_config_var('LIBDIR'))")
    PYTHON_INCLUDE=$($PYTHON_EXE -c "from sysconfig import get_paths; print(get_paths()['include'])")
    NUMPY_INCLUDE=$($PYTHON_EXE -c "import numpy; print(numpy.get_include())")

    echo $PYTHON_EXE
    echo $PYTHON_LIB
    echo $PYTHON_INCLUDE
    echo $NUMPY_INCLUDE
    $PYTHON_EXE --version


    mkdir zfp/build
    pushd zfp/build

    cmake --version

    cmake .. -DBUILD_ZFPY=ON -DPYTHON_EXECUTABLE=$PYTHON_EXE -DPYTHON_LIBRARY=$PYTHON_LIB -DPYTHON_INCLUDE_DIR=$PYTHON_INCLUDE -DPYTHON_NUMPY_INCLUDE_DIR=$NUMPY_INCLUDE

    echo "Build configured"

    make

    popd
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    python zfp/tests/python/test_numpy.py
}
