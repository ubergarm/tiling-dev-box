import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import qualified XMonad.StackSet as W
import XMonad.Layout.Gaps
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.CycleWS
import System.IO
 
-- TODO: would still like fullscreen flash vids to not crop and leave xmobar drawn
-- TODO: remove the red border when doing fullscreen? tried adding 'smartBorders'
--       to the layoutHook but that didn't work
-- TODO: hook in TopicSpaces, start specific apps on specific workspaces
-- TODO: implement golden ratio spiral for new windows
-- TODO: implement program specific floating windows etc.
-- TODO: implement some hot keys for myself
 
main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar.hs"
  xmonad $ defaultConfig {
    modMask = myModMask, 
    borderWidth = 2,
    normalBorderColor = "#202020",
    focusedBorderColor = "#40A040",
    workspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"],         
    terminal = "urxvt",
    manageHook = myManageHook,
    layoutHook = myLayoutHook,
    logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc,
                          ppTitle = xmobarColor "green" "" . shorten 50
                        }
                        
  } `additionalKeys` myKeys      

-- Mod1Mask = left alt, Mod4Mask = left windows key
myModMask = mod1Mask 
-- myManageHook = manageDocks <+> manageHook defaultConfig
myManageHook = composeAll
    [ className =? "Gimp"                   --> doFloat,
      title     =? "mutt"                   --> doFloat,
      title     =? "qiv"                    --> doFloat,
      className =? "VirtualBox"             --> doF (W.shift "4")
      -- title     =? "mplayer"                    --> doFloat,
    ] <+> manageHook defaultConfig
myLayoutHook = avoidStruts $ layoutHook defaultConfig

-- custom key mappings to override defaults
myKeys =
    [ ((0, xK_Print), spawn "scrot -q 50"),              -- capture screen 50% quality
      ((myModMask, xK_f), spawn "iceweasel"),             -- browser
      ((myModMask, xK_Right), nextWS),                    -- next workspace
      ((myModMask, xK_Left), prevWS),                     -- previous workspace
      ((myModMask, xK_equal), spawn "amixer set Master 1+"),  -- turn up volume 1dB
      ((myModMask, xK_minus), spawn "amixer set Master 3-"),  -- turn down volume 3dB
      ((myModMask, xK_F9), spawn "xscreensaver-command -lock && xset dpms force off") -- lock workstation and turn off display
      -- ((myModMask, xK_F1), spawn "xmonad_keys.sh"),       -- toggle custom help
    ]

