import XMonad

main = xmonad $ myConfig

myConfig = defaultConfig {
    terminal = "terminator -T Terminator"
}
