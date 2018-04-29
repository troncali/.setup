#!/usr/bin/env bash

#####################################################################
# CREDITS & LICENSE #################################################
#####################################################################
# Adapted from:
# - https://github.com/TigerVNC/tigervnc/blob/master/BUILDING.txt
#
# Distributed under the MIT license.
#####################################################################

echo "    -> Building and installing TigerVNC Viewer and Server."

###############################################################################
# Set Locations                                                               #
###############################################################################

SETUP_ASSETS=~/.setup-assets

TIGER_URL=github.com/TigerVNC/tigervnc.git
TIGER_DIR="${SETUP_ASSETS}/TigerVNC/source"

ORIG_PATH="$PATH"
X11_LOC="opt/X11"
BREWED_LOC="/usr/local/opt" # Assumes dependencies installed by homebrew.
GETTEXT_LOC="$BREWED_LOC/gettext"
LIBICONV_LOC="$BREWED_LOC/libiconv"
JPEG_LOC="$BREWED_LOC/jpeg-turbo"
LIBTOOL_LOC="$BREWED_LOC/libtool"
GNUTLS_LOC="$BREWED_LOC/gnutls"

###############################################################################
# Source TigerVNC                                                             #
###############################################################################

if [ ! -d $TIGER_DIR ]; then
    git clone git://"$TIGER_URL" "$TIGER_DIR" --quiet
else
    cd "$TIGER_DIR"
    git pull --quiet
fi

cd "$SETUP_ASSETS"/TigerVNC

###############################################################################
# TigerVNC Viewer                                                             #
###############################################################################

PATH="$LIBICONV_LOC/bin:$JPEG_LOC/bin:$LIBTOOL_LOC/bin:$ORIG_PATH"
PATH="$X11_LOC:$GETTEXT_LOC/bin:$PATH"

cmake -G "Unix Makefiles" \
        -DGETTEXT_INCLUDE_DIR=$GETTEXT_LOC/include \
        -DLIBINTL_LIBRARY=$GETTEXT_LOC/lib/libintl.dylib \
        -DICONV_INCLUDE_DIR=$LIBICONV_LOC/include \
        -DICONV_LIBRARIES=$LIBICONV_LOC/lib/libiconv.dylib \
        -DJPEG_INCLUDE_DIR=$JPEG_LOC/include \
        -DJPEG_LIBRARIES=$JPEG_LOC/lib/libjpeg.a \
        -DGNUTLS_INCLUDE_DIR=$GNUTLS_LOC/include \
        -DGNUTLS_LIBRARY=$GNUTLS_LOC/lib/libgnutls.dylib \
        -DCMAKE_VERBOSE_MAKEFILE=OFF \
    source &>/dev/null
make install &>/dev/null

###############################################################################
# TigerVNC Server                                                             #
###############################################################################

# Copy source files to working directory.
mkdir unix
cp -R source/unix/xserver unix/

# Get current stable version of Xserver for MacOS and copy to working dir.
git clone git://github.com/XQuartz/xorg-server.git xorg-server
cd xorg-server && git checkout server-1.16-apple
cd ../ && cp -R xorg-server/* unix/xserver/
    #System files unsuccessful: cp -R /opt/X11/include/xorg/* unix/xserver/

# Patch Xserver for build.
cd unix/xserver/
patch -p1 < ../../source/unix/xserver116.patch

## TODO: Server build fails; configuration needs help.
##       See also https://www.xquartz.org/Developer-Info.html

# Build.
export PKG_CONFIG_PATH="/opt/X11/lib/pkgconfig:/opt/X11/share/pkgconfig"
autoreconf -fiv -I/opt/X11/share/aclocal/ -I/opt/X11/include
./configure --with-apple-application-name=XQuartz --with-pic --without-dtrace \
    --disable-static --disable-dri \
    --disable-xinerama --disable-xvfb --disable-xnest --disable-xorg \
    --disable-dmx --disable-xwin --disable-xephyr --disable-kdrive \
    --disable-config-dbus --disable-config-hal --disable-config-udev \
    --disable-dri2 --enable-install-libxf86config --enable-glx \
    --with-default-font-path="catalogue:/opt/X11/share/fonts/misc/,/opt/X11/share/fonts/TTF/,/opt/X11/share/fonts/OTF,/opt/X11/share/fonts/Type1/,/opt/X11/share/fonts/75dpi/:unscaled,/opt/X11/share/fonts/100dpi/:unscaled,/opt/X11/share/fonts/75dpi/,/opt/X11/share/fonts/100dpi/,/Library/Fonts,/System/Library/Fonts,built-ins" \
    --with-fontdir=/opt/X11/share/fonts \
    --with-xkb-path=/opt/X11/share/X11/xkb \
    --with-xkb-output=/opt/x11/var/cache/xkb \
    --with-xkb-bin-directory=/opt/X11/bin \
    --with-serverconfig-path=/opt/X11/lib/xorg \
    --with-dri-driver-path=/opt/X11/lib/dri \
make TIGERVNC_SRCDIR="$TIGER_DIR"

###############################################################################
# Clean up                                                                    #
###############################################################################

PATH="$ORIG_PATH"
#cd $DIR
