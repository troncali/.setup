#!/usr/bin/env bash

###############################################################################
# CREDITS & LICENSE ###########################################################
###############################################################################
# Adapted from
# - https://github.com/cowboy/dotfiles.git (bin/dotfiles)
#
# Distributed under the MIT license.
###############################################################################

printf "\ntroncali/.setup : init
===================================================
Copying and linking user files.\n"

###############################################################################
# Copy Functions                                                              #
###############################################################################

# Test the file or directory to be copied.
function copy_test() {

    # Does an existing directory match the directory to be copied?
    if [[ -d "$2" && ! "$(diff --brief -r "$1" "$2")" ]]; then
        echo "same directory"

    # Does an existing file match the file to be copied?
    elif [[ -f "$2" && ! "$(cmp "$1" "$2" 2> /dev/null)" ]]; then
        echo "same file"

    # If an existing file doesn't match, is it newer?
    #elif [[ -f "$2" && "$1" -ot "$2" ]]; then
        #echo "destination file newer"
    fi
}

# Copy the file or directory.
function copy_do() {
  cp -r "$2" ~/
}

###############################################################################
# Link Functions                                                              #
###############################################################################

# TODO: What about linking directories / files in subdirectories of 'link' dir?

# Test the file to be linked.
function link_test() {

    # Resolve absolute path of file to be linked.
    # SOURCE: https://stackoverflow.com/questions/7665/how-to-resolve-symbolic-
    # links-in-a-shell-script/42918#42918
    local link_file=$(perl -MCwd -le 'print Cwd::abs_path(shift)' "$1")

    # Resolve absolute path for destination file.
    # SOURCE: See above.
    local dest_file=$2
    while [ -L "${dest_file}" ]; do dest_file=$(readlink `[[ $OSTYPE != darwin* ]] && echo "-f"` "${dest_file}"); done

    # If destination file exists, test whether it matches the file to be linked.
    # SOURCE: https://superuser.com/questions/196572/check-if-two-paths-are-
    # pointing-to-the-same-file
    if [[ -e "$dest_file" && "$(stat -f '%d:%i' "$link_file")" == "$(stat -f '%d:%i' "$dest_file")" ]]; then 
        echo "same file"
    fi 2> /dev/null
}

# Link the file.
function link_do() {
    ln -sf "${DIR}/${2}" ~/
}

###############################################################################
# Copy and Link Files                                                         #
###############################################################################

# Cycle through files to be copied and linked.
function do_stuff() {
    local base dest skip backup_dir
    local files=($1/*)
    local dotfiles=($1/.[!.]*)

    # If there are no files other than .DS_Store, print a message and stop.
    if [[ "${files[@]}" == "$1/*" && ( "${dotfiles[@]}" == "$1/.[!.]*" || "${dotfiles[@]}" == "$1/.DS_Store" ) ]]; then
        echo "       :: No files in $1 directory."; 
        return
    fi

    # Iterate over files.
    for file in "${files[@]}" "${dotfiles[@]}"; do
        base="$(basename $file)"
        dest="$HOME/$base"
        skip="$("$1_test" "$file" "$dest")"
        backup_dir="backup/$(date "+%Y_%m_%d-%H_%M_%S")/"

        # If files is $1 directory or .DS_Store, skip.
        [[ "$file" != "$1/*" && "$file" != "$1/.[!.]*" && "$file" != "$1/.DS_Store" ]] || continue

        # If _test function returns a string, skip file and print that message.
        if [[ "$skip" ]]; then
            echo "       :: Skipping ~/$base, $skip."
            continue
        fi

        # Back up existing file in ~/.
        if [[ -e "$dest" || -L "$dest" ]]; then
            echo "       :: Backing up ~/$base."

            # Create backup dir if it doesn't already exist.
            [[ -e "$backup_dir" ]] || mkdir -p "$backup_dir"

            # Backup file / link / whatever.
            mv "$dest" "$backup_dir"
        fi

        # Do stuff.
        "$1_do" "$base" "$file" 
    done
}

# Process files in "copy" directory.
echo "    -> Copy user files to ~/."
do_stuff copy

# Process files in "link" directory.
echo "    -> Link user files to ~/."
do_stuff link
