#!/usr/bin/env bash

###############################################################################
# CREDITS & LICENSE ###########################################################
###############################################################################
# Adapted from
# - https://github.com/mathiasbynens/dotfiles.git (brew.sh)
# - https://github.com/donnemartin/dev-setup.git (brew.sh)
# - https://github.com/jaywcjlove/awesome-mac
#
# Distributed under the MIT license.
###############################################################################

printf "\ntroncali/.setup : Homebrew
===================================================
"

# Make sure Homebrew is installed and updated.
test_brew

###############################################################################
# Install macOS Applications                                                  #
###############################################################################

echo "    -> Install applications."

MAC_APPS=( "1password        : 1Password"
           "1password-cli    : "
           "atom             : Atom"
           "betterzip        : BetterZip" # For BetterZipQL plugin.
           "cyberduck        : Cyberduck"
           "dash             : Dash"
           "dropbox          : Dropbox"
           "dupeguru         : DupeGuru"
           "electron         : Electron"
           "fontforge        : FontForge"
           "google-chrome    : Google Chrome"
           "inkscape         : Inkscape"
           "java             : Java"
           "microsoft-office : Microsoft Office"
           "openoffice       : OpenOffice"
           "postman          : Postman"
           "sourcetree       : Sourcetree"
           "spark            : Spark"
           "spotify          : Spotify"
           "virtualbox       : VirtualBox"
           "xquartz          : XQuartz"
)

brew_it "cask install" MAC_APPS[@]

###############################################################################
# Update macOS Tools                                                          #
###############################################################################

echo "    -> Update macOS Tools."

# Install GNU core utilities (macOS versions are outdated) and other GNU utils
#     Note: '$PATH' modifications in .zshrc point to GNU utilities before macOS
# utilities so they may be run without a 'g' prefix (sed instead of gsed).
# Remove these paths from .zshrc if you prefer to leave macOS default utilities
# in tact and access GNU utilities with the 'g' prefix. If using a different
# shell, be sure to update your '$PATH' accordingly.
GNU_TOOLS=( "coreutils : GNU core and related utilities"
            "moreutils : "
            "findutils : "
            "gnu-sed   : "
            "gnutls    : "
            "gettext   : "
            "grep      : "
            "wget      : "
            "screen    : "
            "rsync     : "
)

MAC_TOOLS=( "zsh                           : Zsh"
            "vim --with-override-system-vi : Vim"
            "openssh                       : OpenSSH"
)

GIT_TOOLS=( "git        : Git and related tools"
            "git-flow   : " # Repo ops for Vincent Driessen branching model.
            "git-lfs    : " # Git extention for versioning large files.
            "bfg        : " # Simpler, faster alt to git-filter-branch.
#           "git-extras : "
#           "hub        : " # Command line wrapper for git.
)

QL_PLUGS=( "qlcolorcode        : Quick Look plugins"
           "qlstephen          : "
           "qlmarkdown         : "
           "quicklook-json     : "
           "quicklook-csv      : "
           "qlimagesize        : "
           "suspicious-package : "
)

brew_it "install" GNU_TOOLS[@]
brew_it "install" MAC_TOOLS[@]
brew_it "install" GIT_TOOLS[@]
brew_it "cask install" QL_PLUGS[@]

###############################################################################
# Install Miscellaneous Binaries                                              #
###############################################################################

echo "    -> Install other useful CLI tools."

CLI_TOOLS=( "ack                     : "
            "imagemagick --with-webp : " # Bitmap image manipulation tool.
            "pv                      : " # Monitor data progress through pipe.
            "rename                  : " # Rename files according to rules.
            "speedtest_cli           : " # Bandwith test using speedtest.net.
            "tree                    : " # Indented recursive dir list command.
            "dark-mode               : " # CLI for macOS 'Dark Mode'.
            "thefuck                 : " # Corrects errors in console commands.
#           "exiv2                   : " # Utility to manage image metadata.
#           "lua                     : " # Lua programming language.
#           "lynx                    : " # Web browser for Unix platforms.
#           "p7zip                   : " # Command line version of 7-Zip.
#           "pigz                    : " # Parallel implementation of gzip.
#           "rhino                   : " # Java implimentation of JavaScript.
#           "ssh-copy-id             : " # Add public key to remote machine.
#           "testssl                 : " # TLS/SSL security testing.
#           "vbindiff                : " # Hi diffs in hex and ASCII files.
#           "webkit2png              : " # Webpage snapshots from terminal.
#           "zopfli                  : " # Zopfli compression algorithm
#           "libxml2                 : " # XML C parser and toolkit.
#           "libxslt                 : " # XSLT C library.
#           "libxml2 --force         : "
#           "libxslt --force         : "
#           "pkg-config              : " # Tool to help insert compiler options.
#           "libffi                  : " # Foreign Function Interface Library.
#           "pandoc                  : " # Convert one markup format to another.
)

# Capture-the-Flag Tools: see https://github.com/ctfs/write-ups.
CTF_TOOLS=( ""
#           "aircrack-ng : " # Suite of tools to assess WiFi network security.
#           "binutils    : "
#           "binwalk     : " # Tool to analyze and extract firmware images.
#           "cifer       : " # Tool to automate classical cipher cracking in C.
#           "dex2jar     : " # Tools for android .dex and java .class files.
#           "dns2tcp     : " # Tools to encapsulate TCP session in DNS packets.
#           "fcrackzip   : " # Tool to crack zip passwords.
#           "foremost    : " # Tool to recover files.
#           "hashpump    : " # Tool to exploit the hash length extension attack.
#           "hydra       : " # Network logon cracker.
#           "john        : " # John the Ripper password cracker.
#           "knock       : " # Port-knock client.
#           "netpbm      : " # Toolkit for manipulation of graphic images.
#           "nmap        : " # Network discovery and security auditing tool.
#           "pngcheck    : " # PNG image integrity verification and statistics.
#           "socat       : " # Data transfer between independent data channels.
#           "sqlmap      : " # Penetration testing tool for SQL injection flaws.
#           "tcpflow     : " # TCIP/IP packet demultiplexer.
#           "tcpreplay   : " # Edit and replay captured network traffic.
#           "tcptrace    : " # Tool for analysis of TCP dump files.
#           "ucspi""-tcp : " # `tcpserver` etc.
#           "xpdf        : " # PDF viewer and toolkit.
#           "xz          : " # Data compression software.
)

brew_it "install" CLI_TOOLS[@]
#brew_it "install" CTF_TOOLS[@]

###############################################################################
# Clean Up                                                                    #
###############################################################################

echo "    -> Clean up."
brew cleanup > /dev/null
