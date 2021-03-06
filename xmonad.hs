import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "dzen2 -p -xs 1 -ta l -e 'onstart=lower'"
myPP = dzenPP {
    ppHidden = pad
    , ppTitle = pad . dzenColor "#bbb" "" . dzenEscape
    , ppLayout = const ""
}

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig {
    terminal = "terminator -T Terminator"
    , workspaces = map show [1 .. 9 :: Int]
} `additionalKeysP` myKeys

myKeys = [ ("M-q", spawn "killall dzen2 ; xmonad --recompile && xmonad --restart") ]
