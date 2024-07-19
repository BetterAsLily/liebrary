# liebrary
GameJam

## Cloning this project

```bash
git clone https://github.com/BetterAsLily/liebrary.git
```

## Contributing

Making an issue:
  - From the GitHub repo, click "issues" the "new issue"
  - Add issue title and description
  - From the right-side ribbon, select "create branch for issue" (keep the default name)

From your local copy of the repo, open git bash. Run the following:
```bash
git checkout main
git pull
```
You should see your newly created branch pulled down. Run:
```bash
git checkout X-my-branch-name
```
Now write code, add files, whatever the issue is. When done (with the issue, or just for the time being):
```bash
git status
git add .
git commit -m "#X helpful commit comment"
git push
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

I was here the whole time

or was I?
