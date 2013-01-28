import qualified XMonad.StackSet as W
import Data.Bits((.|.))

import XMonad
import XMonad.Config.Gnome (gnomeConfig)
import XMonad.Util.CustomKeys (customKeys)

main = xmonad $ gnomeConfig {
  keys = customKeys delKeys insKeys,
  logHook = return ()  -- TODO: Log something!
  }
  where
    delKeys :: XConfig l -> [(KeyMask, KeySym)]
    delKeys XConfig { modMask = modMask } =
      [ (modMask, xK_p), (modMask, xK_w), (modMask, xK_e) ]

    insKeys :: XConfig l -> [((KeyMask, KeySym), X())]
    insKeys XConfig { modMask = modMask } =
      [ ((modMask, xK_p), spawn "dmenu_run") ]
      ++
      -- Use asd to switch between active workspaces
      [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
       | (key, sc) <- zip [xK_s, xK_d] [0..],
         (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
