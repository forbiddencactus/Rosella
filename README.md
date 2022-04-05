# Rosella
An experimental parallel programming language designed to run jobs on the CPU or GPU. 

# Setup Guide

## Dependencies:
- Bash (on Windows, we recommend Git's (git-scm.com) included bash)
- CMake 3.13.4 or higher. 


## How to build:
You can build Rosella in many different ways:
- Just build it. 
- Generate an Xcode, Visual Studio, etc. project
- Via VSCode and the CMake Tools extension. 
- Via the command line, by generating a Ninja or Make file. 
- Or just manually use cmake. :)

### Just build it:
Simply run our handy setup file!

    sh setup.sh

The setup file will check your cmake installation, create a build folder, and then run cmake and let it decide the best way to build your project. It will place everything in a /build/ folder. If this option fails, you might not have any generator installed or it might be misconfigured.

### Generate an Xcode, Visual Studio, Ninja, or Make Project: 
Simply run our handy setup file, with Xcode, Visual Studio, etc. as an argument... 

    sh setup.sh Xcode

The setup file will check your cmake installation, create a build folder, and then run cmake to generate a project of your choice. It will place everything in a /build/ folder. 
Note that for Visual Studio generators the name changes depending on your Visual Studio install, VS 2019 for instance is "Visual Studio 16 2019". 
Note that you should pick the 'Rosella' target for both building and running. 

### Via VSCode and the CMake Tools extension. 
Simply install VSCode and the CMake Tools extension, and then open the root Rosella folder in VSCode. Then just press CMD/Ctrl + Shift + P, and type: 

    CMake: Configure

On Windows, you might need to go to the CMake Tools settings and make sure that your Cmake Generator setting is set to "Visual Studio 16 2019" (for Visual Studio 2019) as CMake Tools will try to default to Ninja and it doesn't play nice with Visual Studio by default. 

More info is available here: https://code.visualstudio.com/docs/cpp/cmake-linux

Note that you should pick the 'Rosella' target for both building and running. 
