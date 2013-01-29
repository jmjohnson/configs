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
    -- Remap mod-p to dmenu and mod-[sd] to swapping xinerama screens.
    delKeys :: XConfig l -> [(KeyMask, KeySym)]
    delKeys XConfig { modMask = modMask } =
      [ (modMask, xK_p), (modMask, xK_w), (modMask, xK_e) ]

    dmenuBindings = [ ((modMask, xK_p), spawn "dmenu_run") ]
    swapWorkspaceBindings =
      [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
       | (key, sc) <- zip [xK_s, xK_d] [0..],
         (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

    insKeys :: XConfig l -> [((KeyMask, KeySym), X())]
    insKeys XConfig { modMask = modMask } = dmenuBindings ++ swapWorkspaceBindings
