# balena-UxPlay

Turns your raspberry pi into a full AirPlay Server (screen mirror & audio-only playback) using [UxPlay](https://github.com/FDH2/UxPlay).

NOTE:
- Binary has be `dockerized` and is based on [busybox](https://hub.docker.com/_/busybox). Image size, according to `balena-cli` is 1.59 MB.

```
[Info]     ┌─────────┬────────────┬─────────────────────┐
[Info]     │ Service │ Image Size │ Build Time          │
[Info]     ├─────────┼────────────┼─────────────────────┤
[Info]     │ uxplay  │ 1.59 MB    │ 1 minute, 7 seconds │
[Info]     └─────────┴────────────┴─────────────────────┘
[Info]     Build finished in 2 minutes, 11 seconds
                            \
                             \
                              \\
                               \\
                                >\/7
                            _.-(6'  \
                           (=___._/` \
                                )  \ |
                               /   / |
                              /    > /
                             j    < _\
                         _.-' :      ``.
                         \ r=._\        `.
                        <`\\_  \         .`-.
                         \ r-7  `-. ._  ' .  `\
                          \`,      `-.`7  7)   )
                           \/         \|  \'  / `-._
                                      ||    .'
                                       \\  (
                                        >\  >
                                    ,.-' >.'
                                   <.'_.''
                                     <'
```

# Configuration

| ENV Name | Values | Default | Description |
|----------|--------|---------|-------------|
| UXPLAY_NAME | text | not set | | The name that appears offering AirPlay services |
| WXH_RFRSHRATE | text | `1920x1080@60` | Display Resolution @ Refresh Rate (Hz) |
| UXPLAY_FPSLIMIT | integer | `30` | FPS Limit (Hz) |
| UXPLAY_FLIP | `H`, `V`, or `I` | not set | H = horizontal flip (right-left flip, or mirror image); V = vertical flip ; I = 180 degree rotation or inversion  |
| UXPLAY_ROTATE | `R` or `L` | not set | 90 degree Right (clockwise) or Left (counter-clockwise) rotations; these are carried out after any -f transforms. |
| UXPLAY_VIDEOSINK |  `autovideosink`, `ximagesink`, `xvimagesink`, `vaapisink`, `gtksink`, `glimagesink`, `waylandsink`, `osximagesink`, `fpsdisplaysink` | `autovideosink` | GStreamer-specific _video_ plugin backends |
| UXPLAY_AUDIOSINK | `pulsesink`, `alsasink`, `osssink`, `oss4sink`, `osxaudiosink` | `autoaudiosink` | GStreamer-specific _audio_ plugin backends |
| UXPLAY_TIMEOUT | | `0` | Cause the server to relaunch (without stopping `uxplay`) if no connections have been present during the previous timeout seconds. |

# Get latest version

```
git submodule init
git submodule update
```

# Attribution & References
- [UxPlay](https://github.com/FDH2/UxPlay)
- [Dockerize](https://github.com/larsks/dockerize)
- [balena-rpiplay](https://github.com/rahul-thakoor/balena-rpiplay)