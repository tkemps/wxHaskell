-- Menu from XRC demo
module Main where

import Graphics.UI.WXCore
import Graphics.UI.WX

import Paths_samplesTest


main = start gui

gui :: IO ()
gui = 
    do
      xrcmenu <- getDataFileName "xrcmenu.xrc"
      f <- frameLoadRes xrcmenu "menuTest" []
           
      -- Attach event handlers to the menu items loaded above.
      menuItemOnCommandRes f "new" (onFileNew f)
      menuItemOnCommandRes f "open" (onFileOpen f)

      set f [clientSize := sz 400 300]
      windowShow f
      return ()

onFileNew w =
    do
      dlg <- dialog w [text := "File New"]
      ok  <- button dlg [text := "Ok"]
      _   <- showModal dlg (\onPress -> set ok [on command := onPress Nothing])
      return ()

onFileOpen w = 
    do
      dlg <- dialog w [text := "File Open"]
      ok  <- button dlg [text := "Ok"]
      _   <- showModal dlg (\onPress -> set ok [on command := onPress Nothing])
      return ()
