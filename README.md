# liebrary
GameJam

## Cloning this project

```bash
git clone https://github.com/BetterAsLily/liebrary.git
```

## Building godot

### First build only

#### The glorious gcc

Download the msbuildtools manager [here](https://visualstudio.microsoft.com/visual-cpp-build-tools/) and install the "Desktop Development for C++". The default selections are fine.

(Put the manager in your ~/installers folder, Logan, you rat)

Add the resulting install to your PATH (win key, edit environment varaibles, environment variables). Mine looks like this - 

```bash
C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\MSBuild\Current\Bin
```

#### Windows package management

Install chocolatey [here](https://chocolatey.org/install). This is a package manager. It manages packages. Install the following packages (from an elevated terminal)-

```bash
choco install python make mingw
```

Make sure python was added to your PATH. With our new powers, run -

```bash
python -m pip install scons
```

### Subsequent builds

Navigate to the godot source folder and build using scons

```bash
cd ext/godot/
scons platform=windows
```

