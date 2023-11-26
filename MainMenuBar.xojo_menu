#tag Menu
Begin Menu MainMenuBar
   Begin DesktopMenuItem FileMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "&File"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin DesktopMenuItem opt_NewCard
         SpecialMenu = 0
         Index = -2147483648
         Text = "New Card"
         ShortcutKey = "n"
         Shortcut = "Cmd+n"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem opt_Projects
         SpecialMenu = 0
         Index = -2147483648
         Text = "Projects..."
         ShortcutKey = "p"
         Shortcut = "Cmd+p"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem opt_import
         SpecialMenu = 0
         Index = -2147483648
         Text = "Import (WIP)"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem opt_export
         SpecialMenu = 0
         Index = -2147483648
         Text = "Export (WIP)"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopQuitMenuItem FileQuit
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kFileQuit"
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin DesktopMenuItem SettingsMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "Settings"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin DesktopMenuItem opt_KanbanSettings
         SpecialMenu = 0
         Index = -2147483648
         Text = "App Settings"
         ShortcutKey = "y"
         Shortcut = "Cmd+y"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem opt_License
         SpecialMenu = 0
         Index = -2147483648
         Text = "My License"
         ShortcutKey = "Y"
         Shortcut = "Cmd+Shift+Y"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin DesktopMenuItem HelpMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "&Help"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin DesktopMenuItem opt_OrgCards
         SpecialMenu = 0
         Index = 1
         Text = "Organize Cards"
         ShortcutKey = "o"
         Shortcut = "Cmd+o"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem opt_Docs
         SpecialMenu = 0
         Index = -2147483648
         Text = "Documentation"
         ShortcutKey = "i"
         Shortcut = "Cmd+Shift+i"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem opt_about
         SpecialMenu = 0
         Index = -2147483648
         Text = "about"
         ShortcutKey = "a"
         Shortcut = "Cmd+Shift+a"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
End
#tag EndMenu
