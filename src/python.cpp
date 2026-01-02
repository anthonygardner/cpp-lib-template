#include <pybind11/pybind11.h>

#include "mylib.hpp"

namespace py = pybind11;

PYBIND11_MODULE(_mylib, m) {
    m.doc() = "Python bindings for mylib";

    m.def(
        "hello",
        &mylib::hello,
        "Say hello"
    );
}