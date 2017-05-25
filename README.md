A music-manager experiment
==========================

C++ native application that spawns an electron subprocess and communicates over uWebSocekt.

The cmake files currently only support Windows x64 building.

vcpkg is required.

```
vcpkg install uwebsockets:x64-windows
vcpkg install spddlog:x64-windows
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=C:\Path\to\vcpk\gscripts\buildsystems\vcpkg.cmake
```