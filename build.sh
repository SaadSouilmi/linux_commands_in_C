CCX=g++

mkdir -p build/

set -x

$CCX -o build/$1 $1.cpp
