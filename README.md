# .setup

Automate migration to a new device:

- link dotfiles (`.zshrc`, etc.) to home directory (`~/`)
- copy static resources to home directory
- install homebrew, applications, and tools
- configure macOS preferences

### Get Started

```bash
git clone https://github.com/troncali/.setup ~/Code/.setup
```

Then, with minimal effort,

1. Add, edit, or replace dotfiles in `link` folder.
2. Edit `scripts` to reflect your preferences.

_Note: linking dotfiles allows real-time editing and version control in project directory; no need to run the script again._

### Execute `run.sh`

```bash
cd ~/Code/.setup
./run.sh
```

![Image of run.sh](https://raw.githubusercontent.com/troncali/.setup/master/copy/.setup-assets/run.png)

### Customize

| Script                | Purpose                                                                                                                                                                                                                                        |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `init.sh`             | Copies files in `copy` folder and links files in `link` folder. Just modify files in those folders as needed.                                                                                                                                  |
| `brew.sh`             | Installs or updates homebrew, then installs specified applications and tools. Modify the installation arrways with the names of homebrew formulae                                                                                              |
| `macOS.sh`            | Installs XCode CLI Tools, updates macOS preferences in `prefs.sh` (commented out by default, to prevent mistakes), and creates or modifies the `~/Code` directory with github folder icon that matches other folders in the home directory.    |
| `prefs.sh`            | Runs via `macOS.sh` to set macOS preferences. Application-specific setup scripts can be run here. Example: Terminal is configured to use the SMYCK color scheme and custom font (combination of Inconsolata and Menlo, with Powerline glyphs). |
| `data.sh`             | Installs Mongo and SQL database tools via homebrew.                                                                                                                                                                                            |
| `web.sh`              | Installs JavaScript development tools via homebrew, like Node, Yarn, and Chrome Dev Tools. There is also a function to install global node modules, but currently disabled in favor of Yarn Plug'n'Play.                                       |
| `zsh.sh`              | Makes `zsh` the default shell and installs oh-my-zsh.                                                                                                                                                                                          |
| `aws.sh`, `python.sh` | Placeholders (don't do anything). Can be set up like `data.sh` and `web.sh` to install related formulae and run other shell scripts to set up your environment.                                                                                |
