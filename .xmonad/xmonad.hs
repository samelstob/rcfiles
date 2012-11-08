-- default desktop configuration for Fedora

import System.Posix.Env (getEnv)
import Data.Maybe (maybe)

import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ICCCMFocus

main = do
     session <- getEnv "DESKTOP_SESSION"
     xmonad  $ maybe desktopConfig desktop session

desktop "gnome" = gnomeConfig
desktop "kde" = kde4Config
desktop "xfce" = xfceConfig
desktop "xmonad-gnome" = ewmh gnomeConfig
             { modMask = mod4Mask -- Use Super instead of Alt
             , terminal = "gnome-terminal"
             --, startupHook = ewmhDesktopsStartup >> setWMName "LG3D"
             --, logHook = ewmhDesktopsLogHook >> setWMName "LG3D" -- java workaround
             , logHook = takeTopFocus
             }
desktop _ = desktopConfig
             { modMask = mod4Mask -- Use Super instead of Alt
             , terminal = "gnome-terminal"
             , startupHook = setWMName "LG3D"
             }
