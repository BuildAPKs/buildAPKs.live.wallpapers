#!/bin/env bash
# Copyright 2019 (c) all rights reserved 
# by BuildAPKs https://buildapks.github.io
#####################################################################
set -Eeuo pipefail
shopt -s nullglob globstar

_SMATRPERROR_() { # run on script error
	local RV="$?"
	echo "$RV" ma.bash
	printf "\\e[?25h\\n\\e[1;48;5;138mBuildAPKs %s ERROR:  Generated script error %s near or at line number %s by \`%s\`!\\e[0m\\n" "${PWD##*/}" "${1:-UNDEF}" "${2:-LINENO}" "${3:-BASH_COMMAND}"
	exit 147
}

_SMATRPEXIT_() { # run on exit
	printf "\\e[?25h\\e[0m"
	set +Eeuo pipefail 
	exit
}

_SMATRPSIGNAL_() { # run on signal
	local RV="$?"
	printf "\\e[?25h\\e[1;7;38;5;0mBuildAPKs %s WARNING:  Signal %s received!\\e[0m\\n" "ma.bash" "$RV"
 	exit 148 
}

_SMATRPQUIT_() { # run on quit
	local RV="$?"
	printf "\\e[?25h\\e[1;7;38;5;0mBuildAPKs %s WARNING:  Quit signal %s received!\\e[0m\\n" "ma.bash" "$RV"
 	exit 149 
}

trap '_SMATRPERROR_ $? $LINENO $BASH_COMMAND' ERR 
trap _SMATRPEXIT_ EXIT
trap _SMATRPSIGNAL_ HUP INT TERM 
trap _SMATRPQUIT_ QUIT 

_AT_ abstract-art da9f047c50af9df02a2233b2a96f43a77e2e4e17
_AT_ chiralcode/Android-Live-Wallpaper-Template 2bb67a9cca2ddb5f75093e6b285bc9271c71607e
_AT_ emmaguy/FruityLiveWallpaper b74f15b9d01cf8cef5569377a593fa5373cb0207
_AT_ givanse/Flowords c4c01cf68531c4b4270926b0536ec20a5407dc9a
_AT_ givanse/Live-Wallpaper 0c3195e8354b1b9287461b8fccfba4fb1a84f56f
_AT_ jacekmusial/SeismoWallpaper b9ad8d72ef46c3479160f5a60de70b10e353dbbb
_AT_ kirill-grouchnikov/android-live-wallpaper e73040e40fb13b46c9a3a30e5d8cfb1e1a3c7d53
_AT_ matthewmichihara/lanterns-live-wallpaper ccbda7b46aed1716be5322b47326203092e86494
_AT_ matthewmichihara/spontaneous-combustion cc602b8ab3cf97f3d561f00e6c12e15b50a7b3ff
_AT_ MorpheusLee/vertex-wallpaper a26e413e3aac17b84e547b8ecb89358614111544
_AT_ orac/bubblechamber 305476d71faf7122258a500353a68fd5fedff81d
_AT_ PuZZleDucK/android-target-live-wallpaperi 4c59a6086942fecffb21b8ed10725d383838a464
_AT_ PuZZleDucK/Flare-Live-Wallpaper cadecfa9f035e39a96e87adb5a973ca3a91ef4c3 
_AT_ ssaurel/android-clock-livewallpaper 30d8131e0fe8c5787673b9e6f0fd5abc703749aa

#OEF
