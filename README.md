# Native RPC Examples

## Resouces

Links to Youtube, Powerpoints, and GitHub repositories:

- [Native RPC Tutorial (youtube)](https://www.youtube.com/watch?v=V7N-6QusaPY)
- [Native RPC Tutorial (powerpoint)](https://docs.google.com/presentation/d/1C2R0N63_lIGqms3T3wFzZHH_tr3GhvcbqM64IWvBPE4/edit?usp=sharing)
- [Native RPC in GitHub](https://github.com/nativerpc/nativerpc)
- [Native RPC Examples in GitHub](https://github.com/nativerpc/examples)
- [Native RPC Homepage](https://www.nativerpc.com)

## Usage

1. Update submodules.
```
git submodule update --init --recursive
```

2. Install C++/Python/Typescript dependencies
```
init.cmd
```

3. Compile C++ projects
```
cmake -S cpp_server -B cpp_server\build
cmake --build cpp_server\build 
cmake -S cpp_client -B cpp_client\build
cmake --build cpp_client\build 
```

4. Validate workspace settings and start a port monitor
```
nativerpc init
nativerpc files
nativerpc types
nativerpc ps -f
```

5. Execute servers
```
python_server\.venv\Scripts\activate
python python_server\src\main.py
tsx typescript_server\src\main.ts
cpp_server\build\bin\main.exe 
```

6. Execute clients
```
python python_client\src\main.py
tsx typescript_client\src\main.ts
cpp_client\build\bin\main.exe
```
