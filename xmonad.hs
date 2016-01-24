{- Precise install instructions: http://www.haskell.org/haskellwiki/Xmonad/Using_xmonad_in_Gnome#Ubuntu_Precise
 - don't forget to `sudo apt-get install suckless-tools gnome-panel` -}
import qualified XMonad.StackSet as W
import Data.Bits((.|.))

import XMonad
import XMonad.Config.Gnome (gnomeConfig)
import XMonad.Util.CustomKeys (customKeys)
import XMonad.Util.EZConfig (additionalKeysP)

main = xmonad $ gnomeConfig {
  keys = customKeys delKeys insKeys,
  logHook = return ()  -- TODO: Log something!
  } `additionalKeysP` (insertEmail ++ insertWorkEmail ++ insertCseTopAccountReportingMdb ++ insertDate ++ pasteGtechJeff)
  where
    -- Remap mod-p to dmenu and mod-[sd] to swapping xinerama screens.
    delKeys :: XConfig l -> [(KeyMask, KeySym)]
    delKeys XConfig { modMask = modMask } =
      [ (modMask, xK_p), (modMask, xK_w), (modMask, xK_e) ]

    dmenuBindings :: KeyMask -> [((KeyMask, KeySym), X())]
    dmenuBindings modMask = [ ((modMask, xK_p), spawn "dmenu_run") ]

    startChrome :: KeyMask -> [((KeyMask, KeySym), X())]
    startChrome modMask = [ ((modMask, xK_c), spawn "google-chrome") ]

    -- There may be something special about the process when spawned from xmonad here rather than from dmenu_run...
    insertEmail :: [(String, X ())]
    insertEmail = [("M-i 2", spawn "paste_it.sh energy.nexus@gmail.com")]

    insertWorkEmail :: [(String, X ())]
    insertWorkEmail = [("M-i j", spawn "paste_it.sh jeffreyjohnson@google.com ")]

    insertCseTopAccountReportingMdb :: [(String, X ())]
    insertCseTopAccountReportingMdb = [("M-i c s e", spawn "paste_it.sh cse-top-account-reporting")]

    insertDate :: [(String, X ())]
    insertDate = [("M-i d", spawn "paste_it.sh $(date --rfc-3339=date)")]

    pasteGtechJeff :: [(String, X ())]
    pasteGtechJeff = [("M-i g", spawn "paste_it.sh https://plus.google.com/hangouts/_/google.com/gtechjeff; xdotool key Return")]

    -- TODO: generate substitutions from a file.

    swapWorkspaceBindings :: KeyMask -> [((KeyMask, KeySym), X())]
    swapWorkspaceBindings modMask =
      [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
       | (key, sc) <- zip [xK_s, xK_d] [0..],
         (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

    insKeys :: XConfig l -> [((KeyMask, KeySym), X())]
    insKeys XConfig { modMask = modMask } = dmenuBindings modMask ++ swapWorkspaceBindings modMask ++ startChrome modMask
