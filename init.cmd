@echo off

:: Native RPC
cmake -E cmake_echo_color --yellow "-----Native RPC-----"
if not exist "nativerpc" (
    git clone git@github.com:nativerpc/nativerpc
)
git -C nativerpc pull
pushd nativerpc
call npm i
python -m build
cmake -B build
cmake --build build --target install
popd

:: Python projects
cmake -E cmake_echo_color --yellow "-----Python projects-----"
mkdir python_server>nul
mkdir python_client>nul
pushd python_server
if not exist ".venv" (
    python -m venv .venv
)
call .venv\Scripts\activate
cmake -E echo "[project]">pyproject.toml
cmake -E echo "name = ""python_server""">>pyproject.toml
cmake -E echo "-e ../nativerpc">requirements.txt
if not exist "src" (
    mkdir src
    cmake -E echo "print('hello world')">src\main.py
    cmake -E echo "# todo">src\common.py
)
python -m pip install -r requirements.txt
popd

pushd python_client
if not exist ".venv" (
    python -m venv .venv
)
call .venv\Scripts\activate
cmake -E echo "[project]">pyproject.toml
cmake -E echo "name = ""python_client""">>pyproject.toml
cmake -E echo "-e ../nativerpc">requirements.txt
if not exist "src" (
    mkdir src
    cmake -E echo "print('hello world')">src\main.py
    cmake -E echo "# todo">src\common.py
)
python -m pip install -r requirements.txt
popd

:: Typescript projects
cmake -E cmake_echo_color --yellow "-----Typescript projects-----"
mkdir typescript_server>nul
mkdir typescript_client>nul
pushd typescript_server
call npm init -y>nul
call npm add ..\nativerpc
call npm add -D typescript
call npm i
if not exist "src" (
    mkdir src
    cmake -E echo "console.log('hello world')">src\main.ts
    cmake -E echo "// todo">src\common.ts
)
popd

pushd typescript_client
call npm init -y>nul
call npm add ..\nativerpc
call npm add -D typescript
call npm i
if not exist "src" (
    mkdir src
    cmake -E echo "console.log('hello world')">src\main.ts
    cmake -E echo "// todo">src\common.ts
)
popd

:: C++ projects
cmake -E cmake_echo_color --yellow "-----C++ projects-----"
mkdir cpp_server>nul
mkdir cpp_client>nul
pushd cpp_server
if not exist "src" (
    nativerpc initcpp
    mkdir src
    cmake -E echo "int main() {return 0;}">src\main.cpp
    cmake -E echo "// todo">src\common.h
)
cmake -B build 
cmake --build build
popd

pushd cpp_client
if not exist "src" (
    nativerpc initcpp
    mkdir src
    cmake -E echo "int main() {return 0;}">src\main.cpp
    cmake -E echo "// todo">src\common.h
)
cmake -B build 
cmake --build build
popd

:: Workspace
cmake -E cmake_echo_color --yellow "-----Workspace-----"
nativerpc init
@REM nativerpc files

:: Success
cmake -E cmake_echo_color --yellow "-----Success-----"
