# Define custom utilities
# Test for macOS with [ -n "$IS_OSX" ]

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.

    $PYTHON_EXE -m pip install numpy cython scikit-build

    if [ $TRAVIS_OS_NAME == "osx" ]; then
        export LIBRARY_PATH=$LIBRARY_PATH:$(pwd)/zfp/build/lib/
        $PYTHON_EXE -m pip install cmake
    else
        # Need to tell auditwheel where to find libzfp
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)/zfp/build/lib64/
        $PYTHON_EXE -m pip install "cmake<3.14"
    fi

    PYTHON_LIB=$($PYTHON_EXE -c "from distutils import sysconfig; print(sysconfig.get_config_var('LIBDIR'))")
    PYTHON_INCLUDE=$($PYTHON_EXE -c "from sysconfig import get_paths; print(get_paths()['include'])")
    NUMPY_INCLUDE=$($PYTHON_EXE -c "import numpy; print(numpy.get_include())")
    BUILD_DIR="zfp/build"

    echo $BUILD_DIR
    echo $PYTHON_EXE
    echo $PYTHON_LIB
    echo $PYTHON_INCLUDE
    echo $NUMPY_INCLUDE
    $PYTHON_EXE --version

    mkdir $BUILD_DIR
    pushd $BUILD_DIR

    cmake --version
    cmake .. -DBUILD_ZFPY=ON -DBUILD_TESTING=OFF -DPYTHON_EXECUTABLE=$PYTHON_EXE -DPYTHON_LIBRARY=$PYTHON_LIB -DPYTHON_INCLUDE_DIR=$PYTHON_INCLUDE -DPYTHON_NUMPY_INCLUDE_DIR=$NUMPY_INCLUDE
    make

    popd
}

function run_tests {
    # Everything on llnl/zfp devel branch has passed unit tests.
    :
}
