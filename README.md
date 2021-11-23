## SPEEDP

A homebrew version of a retro game for the Nintendo Game Boy, written in C using the following tools:

[GBDK 2020](https://github.com/gbdk-2020/gbdk-2020) <br />
[GBTD](http://www.devrs.com/gb/hmgd/gbtd.html) <br />
[GBMB](http://www.devrs.com/gb/hmgd/gbmb.html) <br />
[HUGETracker](https://nickfa.ro/index.php/HUGETracker) <br />
[hUGEDriver](https://github.com/SuperDisk/hUGEDriver) <br />

### To compile the code

1. Get GBDK-2020 and hUGEDriver, install and configure them as described in their pages
2. Edit the lcc (gbdk\bin) and include (hUGEDriver\include) paths in the make file to match their directories on your machine.
3. Run the make file and the included gb rom with the code will be replaced with the new one.

### Only want to play the game?

Simply download the speedp.gb rom file, which is already included with the code, and open it with a Game Boy emulator to your liking.
