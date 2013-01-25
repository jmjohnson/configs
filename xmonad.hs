import XMonad
import XMonad.Config.Gnome (gnomeConfig)
import XMonad.Util.CustomKeys (customKeys)

main = xmonad $ gnomeConfig
{-
  keys = customKeys delKeys insKeys }
  where
    delKeys :: XConfig l -> [(KeyMask, KeySym)]
    delKeys XConfig { modMask = modMask } =
      [ (modMask, xK_p) ]

    insKeys :: XConfig l -> [((KeyMask, KeySym), X())]
    insKeys XConfig { modMask = modMask } =
      [ ((modMask, xK_p), spawn "dmenu_run") ]
-}
