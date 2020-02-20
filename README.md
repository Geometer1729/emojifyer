
Emojify is a program for replaceing your currently typed text in discord with its most succinct representation entirely using emojis.
This usually consists mainly of regional indicators but emoji such as :b: :a: :ab: :sos: :up: etc. are used whenever possible.
The default script assumes you have alt+e bound to run this script and lifts those keys to prevent activating any other key binds.
If you intend to use some other binding change the first two lines of ./emojify to reflect that.

# Requirements 

- xclip
- xdotool
- ghc
- dmenu


# Installation

```
git clone "https://github.com/Geometer1729/emojifyer.git"
cd emojifyer
sudo make
```
This installs the program at  `/bin/emojify` and the haskell backend at `/bin/emojifyer`.
