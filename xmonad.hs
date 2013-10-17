{- Precise install instructions: http://www.haskell.org/haskellwiki/Xmonad/Using_xmonad_in_Gnome#Ubuntu_Precise
 - don't forget to `sudo apt-get install suckless-tools gnome-panel` -}
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

    dmenuBindings :: KeyMask -> [((KeyMask, KeySym), X())]
    dmenuBindings modMask = [ ((modMask, xK_p), spawn "dmenu_run") ]

    startChrome :: KeyMask -> [((KeyMask, KeySym), X())]
    startChrome modMask = [ ((modMask, xK_c), spawn "google-chrome") ]

    swapWorkspaceBindings :: KeyMask -> [((KeyMask, KeySym), X())]
    swapWorkspaceBindings modMask =
      [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
       | (key, sc) <- zip [xK_s, xK_d] [0..],
         (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

    insKeys :: XConfig l -> [((KeyMask, KeySym), X())]
    insKeys XConfig { modMask = modMask } = dmenuBindings modMask ++ swapWorkspaceBindings modMask ++ startChrome modMask
