import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Spacing

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
    , layoutHook = spacing 2 $ Tall 1 (3/100) (1/2)
}
