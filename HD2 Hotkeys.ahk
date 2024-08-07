/*
Helldivers 2 Stratagem AutoHotkey v2 script with GUI
Version 1.2

https://github.com/Dazuzi/HD2StratHotkeysGUI
*/

#Requires Autohotkey v2
#SingleInstance Force
#NoTrayIcon

HotkeyStratagems := ["1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1"]
HotkeyButtonHandles := ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"]
GameTitle	:= "HELLDIVERS™ 2"
ConfigFile	:= "HD2 Config.ini"
Stratagems	:= [{Category:"No Stratagem", Name: "No Stratagem", Icon:"No Stratagem.png"}
			, {Category:"Common",	Name:"Reinforce",						Icon:"Reinforce.png",					Keys:["1", "2", "4", "3", "1"]}
			, {Category:"Common",	Name:"SoS Beacon",						Icon:"SoS Beacon.png",					Keys:["1", "2", "4", "1"]}
			, {Category:"Common",	Name:"Resupply",						Icon:"Resupply.png",					Keys:["2", "2", "1", "4"]}
			, {Category:"Common",	Name:"Eagle Rearm",						Icon:"Eagle Rearm.png",					Keys:["1", "1", "3", "1", "4"]}
			, {Category:"Mission",	Name:"SSSD Delivery",					Icon:"SSSD Delivery.png",				Keys:["2", "2", "2", "1", "1"]}
			, {Category:"Mission",	Name:"Prospecting Drill",				Icon:"Prospecting Drill.png",			Keys:["2", "2", "3", "4", "2", "2"]}
			, {Category:"Mission",	Name:"Super Earth Flag",				Icon:"Super Earth Flag.png",			Keys:["2", "1", "2", "1"]}
			, {Category:"Mission",	Name:"NUX-223 Hellbomb",				Icon:"Hellbomb.png",					Keys:["2", "1", "3", "2", "1", "4", "2", "1"]}
			, {Category:"Mission",	Name:"Upload Data",						Icon:"Upload Data.png",					Keys:["3", "4", "1", "1", "1"]}
			, {Category:"Mission",	Name:"Seismic Probe",					Icon:"Seismic Probe.png",				Keys:["1", "1", "3", "4", "2", "2"]}
			, {Category:"Mission",	Name:"Orbital Illumination Flare",		Icon:"Orbital Illumination Flare.png",	Keys:["4", "4", "3", "3"]}
			, {Category:"Mission",	Name:"SEAF Artillery",					Icon:"SEAF Artillery.png",				Keys:["4", "1", "1", "2"]}
			, {Category:"Mission",	Name:"Dark Fluid Vessel",				Icon:"Dark Fluid Vessel.png",			Keys:["1", "3", "4", "2", "1", "1"]}
			, {Category:"Mission",	Name:"Tectonic Drill",					Icon:"Tectonic Drill.png",				Keys:["1", "2", "1", "2", "1", "2"]}
			, {Category:"Mission",	Name:"Hive Breaker Drill",				Icon:"Hive Breaker Drill.png",			Keys:["3", "1", "2", "4", "2", "2"]}
			, {Category:"Offensive",Name:"Eagle 500kg Bomb",				Icon:"Eagle 500kg Bomb.png",			Keys:["1", "4", "2", "2", "2"]}
			, {Category:"Offensive",Name:"Orbital Gatling Barrage",			Icon:"Orbital Gatling Barrage.png",		Keys:["4", "2", "3", "1", "1"]}
			, {Category:"Offensive",Name:"Eagle Airstrike",					Icon:"Eagle Airstrike.png",				Keys:["1", "4", "2", "4"]}
			, {Category:"Offensive",Name:"Orbital Walking Barrage",			Icon:"Orbital Walking Barrage.png",		Keys:["4", "2", "4", "2", "4", "2"]}
			, {Category:"Offensive",Name:"Eagle Strafing Run",				Icon:"Eagle Strafing Run.png",			Keys:["1", "4", "4"]}
			, {Category:"Offensive",Name:"Orbital EMS Strike",				Icon:"Orbital EMS Strike.png",			Keys:["4", "4", "3", "2"]}
			, {Category:"Offensive",Name:"Eagle Smoke Strike",				Icon:"Eagle Smoke Strike.png",			Keys:["1", "4", "1", "2"]}
			, {Category:"Offensive",Name:"Orbital Gas Strike",				Icon:"Orbital Gas Strike.png",			Keys:["4", "4", "2", "4"]}
			, {Category:"Offensive",Name:"Orbital Railcannon Strike",		Icon:"Orbital Railcannon Strike.png",	Keys:["4", "1", "2", "2", "4"]}
			, {Category:"Offensive",Name:"Eagle Cluster Bomb",				Icon:"Eagle Cluster Bomb.png",			Keys:["1", "4", "2", "2", "4"]}
			, {Category:"Offensive",Name:"Orbital Smoke Strike",			Icon:"Orbital Smoke Strike.png",		Keys:["4", "4", "2", "1"]}
			, {Category:"Offensive",Name:"Orbital Airburst Strike",			Icon:"Orbital Airburst Strike.png",		Keys:["4", "4", "4"]}
			, {Category:"Offensive",Name:"Orbital Laser",					Icon:"Orbital Laser.png",				Keys:["4", "2", "1", "4", "2"]}
			, {Category:"Offensive",Name:"Orbital Precision Strike",		Icon:"Orbital Precision Strike.png",	Keys:["4", "4", "1"]}
			, {Category:"Offensive",Name:"Orbital 380mm HE Barrage",		Icon:"Orbital 380MM HE Barrage.png",	Keys:["4", "2", "1", "1", "3", "2", "2"]}
			, {Category:"Offensive",Name:"Eagle Napalm Airstrike",			Icon:"Eagle Napalm Airstrike.png",		Keys:["1", "4", "2", "1"]}
			, {Category:"Offensive",Name:"Orbital 120mm HE Barrage",		Icon:"Orbital 120MM HE Barrage.png",	Keys:["4", "4", "2", "3", "4", "2"]}
			, {Category:"Offensive",Name:"Eagle 110mm Rocket Pods",			Icon:"Eagle 110MM Rocket Pods.png",		Keys:["1", "4", "1", "3"]}
			, {Category:"Supply",	Name:"MLS-4X Commando",					Icon:"Commando.png",					Keys:["2", "3", "1", "2", "4"]}
			, {Category:"Supply",	Name:"EXO-49 Emancipator Exosuit",		Icon:"Emancipator Exosuit.png",			Keys:["3", "2", "4", "1", "3", "2", "1"]}
			, {Category:"Supply",	Name:"M-105 Stalwart",					Icon:"Stalwart.png",					Keys:["2", "3", "2", "1", "1", "3"]}
			, {Category:"Supply",	Name:"AC-8 Autocannon",					Icon:"Autocannon.png",					Keys:["2", "3", "2", "1", "1", "4"]}
			, {Category:"Supply",	Name:"EXO-45 Patriot Exosuit",			Icon:"Patriot Exosuit.png",				Keys:["3", "2", "4", "1", "3", "2", "2"]}
			, {Category:"Supply",	Name:"MG-206 Heavy Machine Gun",		Icon:"Heavy Machine Gun.png",			Keys:["2", "3", "1", "2", "2"]}
			, {Category:"Supply",	Name:"SH-32 Shield Generator Pack",		Icon:"Shield Generator Pack.png",		Keys:["2", "1", "3", "4", "3", "4"]}
			, {Category:"Supply",	Name:"RL-77 Airburst Rocket Launcher",	Icon:"Airburst Rocket Launcher.png",	Keys:["2", "1", "1", "3", "4"]}
			, {Category:"Supply",	Name:"RS-422 Railgun",					Icon:"Railgun.png",						Keys:["2", "4", "2", "1", "3", "4"]}
			, {Category:"Supply",	Name:"LAS-98 Laser Cannon",				Icon:"Laser Cannon.png",				Keys:["2", "3", "2", "1", "3"]}
			, {Category:"Supply",	Name:"ARC-3 Arc Thrower",				Icon:"Arc Thrower.png",					Keys:["2", "4", "2", "1", "3", "3"]}
			, {Category:"Supply",	Name:"AX/AR-23 `"Guard Dog`"",			Icon:"Guard Dog.png",					Keys:["2", "1", "3", "1", "4", "2"]}
			, {Category:"Supply",	Name:"FAF-14 Spear",					Icon:"Spear.png",						Keys:["2", "2", "1", "2", "2"]}
			, {Category:"Supply",	Name:"GL-21 Grenade Launcher",			Icon:"Grenade Launcher.png",			Keys:["2", "3", "1", "3", "2"]}
			, {Category:"Supply",	Name:"MG-43 Machine Gun",				Icon:"Machine Gun.png",					Keys:["2", "3", "2", "1", "4"]}
			, {Category:"Supply",	Name:"SH-20 Ballistic Shield Backpack",	Icon:"Ballistic Shield Backpack.png",	Keys:["2", "3", "2", "2", "1", "3"]}
			, {Category:"Supply",	Name:"B-1 Supply Pack",					Icon:"Supply Pack.png",					Keys:["2", "3", "2", "1", "1", "2"]}
			, {Category:"Supply",	Name:"FLAM-40 Flamethrower",			Icon:"Flamethrower.png",				Keys:["2", "3", "1", "2", "1"]}
			, {Category:"Supply",	Name:"AX/LAS-5 `"Guard Dog`" Rover",	Icon:"Guard Dog Rover.png",				Keys:["2", "1", "3", "1", "4", "4"]}
			, {Category:"Supply",	Name:"GR-8 Recoilless Rifle",			Icon:"Recoilless Rifle.png",			Keys:["2", "3", "4", "4", "3"]}
			, {Category:"Supply",	Name:"LIFT-850 Jump Pack",				Icon:"Jump Pack.png",					Keys:["2", "1", "1", "2", "1"]}
			, {Category:"Supply",	Name:"APW-1 Anti-Materiel Rifle",		Icon:"Anti-Material Rifle.png",			Keys:["2", "3", "4", "1", "2"]}
			, {Category:"Supply",	Name:"EAT-17 Expendable Anti-Tank",		Icon:"Expendable Anti-Tank.png",		Keys:["2", "2", "3", "1", "4"]}
			, {Category:"Supply",	Name:"LAS-99 Quasar Cannon",			Icon:"Quasar Cannon.png",				Keys:["2", "2", "1", "3", "4"]}
			, {Category:"Defensive",Name:"Anti-Tank Mines",					Icon:"Anti-Tank Mines.png",				Keys:["2", "3", "1", "1"]}
			, {Category:"Defensive",Name:"FX-12 Shield Generator Relay",	Icon:"Shield Generator Relay.png",		Keys:["2", "2", "3", "4", "3", "4"]}
			, {Category:"Defensive",Name:"A/M-23 EMS Mortar Sentry",		Icon:"EMS Mortar Sentry.png",			Keys:["2", "1", "4", "2", "4"]}
			, {Category:"Defensive",Name:"A/MLS-4X Rocket Sentry",			Icon:"Rocket Sentry.png",				Keys:["2", "1", "4", "4", "3"]}
			, {Category:"Defensive",Name:"A/G-16 Gatling Sentry",			Icon:"Gatling Sentry.png",				Keys:["2", "1", "4", "3"]}
			, {Category:"Defensive",Name:"A/ARC-3 Tesla Tower",				Icon:"Tesla Tower.png",					Keys:["2", "1", "4", "1", "3", "4"]}
			, {Category:"Defensive",Name:"A/M-12 Mortar Sentry",			Icon:"Mortar Sentry.png",				Keys:["2", "1", "4", "4", "2"]}
			, {Category:"Defensive",Name:"MD-6 Anti-Personnel Minefield",	Icon:"Anti-Personnel Minefield.png",	Keys:["2", "3", "1", "4"]}
			, {Category:"Defensive",Name:"A/MG-43 Machine Gun Sentry",		Icon:"Machine Gun Sentry.png",			Keys:["2", "1", "4", "4", "1"]}
			, {Category:"Defensive",Name:"A/AC-8 Autocannon Sentry",		Icon:"Autocannon Sentry.png",			Keys:["2", "1", "4", "1", "3", "1"]}
			, {Category:"Defensive",Name:"MD-I4 Incendiary Mines",			Icon:"Incendiary Mines.png",			Keys:["2", "3", "3", "2"]}
			, {Category:"Defensive",Name:"E/MG-101 HMG Emplacement",		Icon:"HMG Emplacement.png",				Keys:["2", "1", "3", "4", "4", "3"]}]

GUIConstructor()

GUIConstructor() {
	Try TraySetIcon("resources\HD2.png")
	HotkeysGUI := Gui()
	HotkeysGUI.Title := "HELLDIVERS™ 2 Stratagem Hotkeys"
	HotkeysGUI.BackColor := "171717"
	HotkeysGUI.SetFont("cBABABA")

	Try HotkeysGUI.Add("Picture", "w776 h-1", "resources\HD2 Banner.png")

	Tab := HotkeysGUI.Add("Tab3", "Background383333 cE1CB00", [" Hotkeys ", " Settings ", " About "])
	Tab.UseTab(1)

	HotkeysGUI.Add("Text", "Section w180", "Numlock")
	HotkeysGUI.Add("Text", "x+m w180", "NumpadDiv")
	HotkeysGUI.Add("Text", "x+m w180", "NumpadMult")
	HotkeysGUI.Add("Text", "x+m w180", "NumpadSub")

	Global HotkeyNumlock := HotkeysGUI.Add("Button", "xs h42 w180 left background383333")
	HotkeyNumlock.OnEvent("Click", ShowStratagemMenu.Bind(1))
	Global HotkeyNumpadDiv := HotkeysGUI.Add("Button", "x+m h42 w180 left background383333")
	HotkeyNumpadDiv.OnEvent("Click", ShowStratagemMenu.Bind(2))
	Global HotkeyNumpadMult := HotkeysGUI.Add("Button", "x+m h42 w180 left background383333")
	HotkeyNumpadMult.OnEvent("Click", ShowStratagemMenu.Bind(3))
	Global HotkeyNumpadSub := HotkeysGUI.Add("Button", "x+m h42 w180 left background383333")
	HotkeyNumpadSub.OnEvent("Click", ShowStratagemMenu.Bind(4))

	HotkeysGUI.Add("Text", "xs y+25 w180", "Numpad7 / NumpadHome")
	HotkeysGUI.Add("Text", "x+m w180", "Numpad8 / NumpadUp")
	HotkeysGUI.Add("Text", "x+m w180", "Numpad9 / NumpadPgUp")
	HotkeysGUI.Add("Text", "x+m w180", "NumpadAdd")
	Global HotkeyNumpad7 := HotkeysGUI.Add("Button", "xs h42 w180 left background383333")
	HotkeyNumpad7.OnEvent("Click", ShowStratagemMenu.Bind(5))
	Global HotkeyNumpad8 := HotkeysGUI.Add("Button", "x+m h42 w180 left background383333")
	HotkeyNumpad8.OnEvent("Click", ShowStratagemMenu.Bind(6))
	Global HotkeyNumpad9 := HotkeysGUI.Add("Button", "x+m h42 w180 left background383333")
	HotkeyNumpad9.OnEvent("Click", ShowStratagemMenu.Bind(7))
	Global HotkeyNumpadAdd := HotkeysGUI.Add("Button", "x+m h42 w180 left background383333")
	HotkeyNumpadAdd.OnEvent("Click", ShowStratagemMenu.Bind(8))

	HotkeysGUI.Add("Text", "xs y+25 w180", "Numpad4 / NumpadLeft")
	HotkeysGUI.Add("Text", "x+m w180", "Numpad5 / NumpadClear")
	HotkeysGUI.Add("Text", "x+m w180", "Numpad6 / NumpadRight")
	Global HotkeyNumpad4 := HotkeysGUI.Add("Button", "xs h42 w180 left background383333")
	HotkeyNumpad4.OnEvent("Click", ShowStratagemMenu.Bind(9))
	Global HotkeyNumpad5 := HotkeysGUI.Add("Button", "x+m h42 w180 left background383333")
	HotkeyNumpad5.OnEvent("Click", ShowStratagemMenu.Bind(10))
	Global HotkeyNumpad6 := HotkeysGUI.Add("Button", "x+m h42 w180 left background383333")
	HotkeyNumpad6.OnEvent("Click", ShowStratagemMenu.Bind(11))

	HotkeysGUI.Add("Text", "xs y+25 w180", "Numpad1 / NumpadEnd")
	HotkeysGUI.Add("Text", "x+m w180", "Numpad2 / NumpadDown")
	HotkeysGUI.Add("Text", "x+m w180", "Numpad3 / NumpadPgDn")
	HotkeysGUI.Add("Text", "x+m w180", "NumpadEnter")
	Global HotkeyNumpad1 := HotkeysGUI.Add("Button", "xs h42 w180 left background383333")
	HotkeyNumpad1.OnEvent("Click", ShowStratagemMenu.Bind(12))
	Global HotkeyNumpad2 := HotkeysGUI.Add("Button", "x+m h42 w180 left background383333")
	HotkeyNumpad2.OnEvent("Click", ShowStratagemMenu.Bind(13))
	Global HotkeyNumpad3 := HotkeysGUI.Add("Button", "x+m h42 w180 left background383333")
	HotkeyNumpad3.OnEvent("Click", ShowStratagemMenu.Bind(14))
	Global HotkeyNumpadEnter := HotkeysGUI.Add("Button", "x+m h42 w180 left background383333")
	HotkeyNumpadEnter.OnEvent("Click", ShowStratagemMenu.Bind(15))

	HotkeysGUI.Add("Text", "xs y+25 w180", "Numpad0 / NumpadIns")
	HotkeysGUI.Add("Text", "x+m w180")
	HotkeysGUI.Add("Text", "x+m w180", "NumpadDot / NumpadDel")
	Global HotkeyNumpad0 := HotkeysGUI.Add("Button", "xs h42 w180 left background383333")
	HotkeyNumpad0.OnEvent("Click", ShowStratagemMenu.Bind(16))
	HotkeysGUI.Add("Text", "x+m w180")
	Global HotkeyNumpadDot := HotkeysGUI.Add("Button", "x+m h42 w180 left background383333")
	HotkeyNumpadDot.OnEvent("Click", ShowStratagemMenu.Bind(17))

	ButtonIcon(ButtonHandle, Index) {
		ButtonIL := Buffer(20 + A_PtrSize)
		NewIL := DllCall("ImageList_Create", "Int", (36 * A_ScreenDPI / 96), "Int", (36 * A_ScreenDPI / 96), "UInt", 0x21, "Int", 1, "Int", 1)
		NumPut("Ptr", NewIL, ButtonIL, 0)
		NumPut("UInt", 0, ButtonIL, 0 + A_PtrSize)
		NumPut("UInt", 0, ButtonIL, 4 + A_PtrSize)
		NumPut("UInt", 0, ButtonIL, 8 + A_PtrSize)
		NumPut("UInt", 0, ButtonIL, 12 + A_PtrSize)
		NumPut("UInt", 0, ButtonIL, 16 + A_PtrSize)
		SendMessage(BCM_SETIMAGELIST := 5634, 0, ButtonIL, ButtonHandle)
		IL_Add(NewIL, "resources\" Stratagems[HotkeyStratagems[Index]].Icon, 1)
		if (HotkeyButtonHandles[Index] > 0)
			IL_Destroy(HotkeyButtonHandles[Index])
		HotkeyButtonHandles[Index] := NewIL
	}

	ShowStratagemMenu(HotkeyID, ButtonID, *) {
		Global MenuHotkeyID := HotkeyID
		Global MenuButtonID := ButtonID
		ControlGetPos &x, &y,, &h, ButtonID
		Category := Stratagems[HotkeyStratagems[HotkeyID]].Category
		Stratagem := Stratagems[HotkeyStratagems[HotkeyID]].Name
		Switch Category {
			Case "No Stratagem": StratagemMenu.Check(Stratagem)
			Case "Common": CommonSubmenu.Check(Stratagem)
			Case "Mission": MissionSubmenu.Check(Stratagem)
			Case "Offensive": OffensiveSubmenu.Check(Stratagem)
			Case "Supply": SupplySubmenu.Check(Stratagem)
			Case "Defensive": DefensiveSubmenu.Check(Stratagem)
		}
		StratagemMenu.Show(x, y + h)
		Switch Category {
			Case "No Stratagem": StratagemMenu.Uncheck(Stratagem)
			Case "Common": CommonSubmenu.Uncheck(Stratagem)
			Case "Mission": MissionSubmenu.Uncheck(Stratagem)
			Case "Offensive": OffensiveSubmenu.Uncheck(Stratagem)
			Case "Supply": SupplySubmenu.Uncheck(Stratagem)
			Case "Defensive": DefensiveSubmenu.Uncheck(Stratagem)
		}
	}

	StratagemMenuHandler(Index, *) {
		HotkeyStratagems[MenuHotkeyID] := Index
		MenuButtonID.Text := " " Stratagems[Index].Name
		ButtonIcon(MenuButtonID.Hwnd, MenuHotkeyID)
		SaveHotkeys
	}

	SaveHotkeys() {
		Settings := ""
		for setting in HotkeyStratagems
			Settings := Settings " " setting
		IniWrite LTrim(Settings), ConfigFile, "Profiles", Profile.Text
	}

	Tab.UseTab(2)
	HotkeysGUI.Add("Text", "Section", "Minimum press duration/delay between presses")
	MinimumDelayEdit := HotkeysGUI.Add("Edit", "ys Limit3 Number w75 Background4B4B4B cBABABA")
	MinimumDelayEdit.OnEvent("Change", SettingsChange.Bind("MinimumDelay"))
	Global MinimumDelay := HotkeysGUI.Add("UpDown", "vMinUpDown Range10-999", IniRead(ConfigFile, "Settings", "MinimumDelay", "40"))
	MinimumDelay.OnEvent("Change", SettingsChange.Bind("MinimumDelay"))
	HotkeysGUI.Add("Text", "ys", "milliseconds (Default: 40)")
	HotkeysGUI.Add("Text", "xs", "If the macro is failing to input the stratagem properly, try increasing this value.")

	SettingsChange(SettingName, GUIControlID, *) {
		IniWrite GUIControlID.Value, ConfigFile, "Settings", SettingName
	}

	HotkeysGUI.Add("Text", "xs y+30", "Stratagem keys:")

	HotkeysGUI.Add("Text", "Section", "Open stratagem list")
	HotkeysGUI.Add("Text",, "Up")
	HotkeysGUI.Add("Text",, "Down")
	HotkeysGUI.Add("Text",, "Left")
	HotkeysGUI.Add("Text",, "Right")

	Global StratagemKey := HotkeysGUI.Add("DropDownList", "ys Background4B4B4B cBABABA", ["Control", "Alt", "Shift"])
	StratagemKey.OnEvent("Change", ChangeKey.Bind("StratagemKey", "Control"))
	StratagemKey.Value := IniRead(ConfigFile, "Settings", "StratagemKey", 1)
	UpKey := HotkeysGUI.Add("Hotkey", "vUpKey Limit190")
	UpKey.OnEvent("Change", ChangeKey.Bind("UpKey", "w"))
	UpKey.Value := IniRead(ConfigFile, "Settings", "UpKey", "w")
	DownKey := HotkeysGUI.Add("Hotkey", "vDownKey Limit190")
	DownKey.OnEvent("Change", ChangeKey.Bind("DownKey", "s"))
	DownKey.Value := IniRead(ConfigFile, "Settings", "DownKey", "s")
	LeftKey := HotkeysGUI.Add("Hotkey", "vLeftKey Limit190")
	LeftKey.OnEvent("Change", ChangeKey.Bind("LeftKey", "a"))
	LeftKey.Value := IniRead(ConfigFile, "Settings", "LeftKey", "a")
	RightKey := HotkeysGUI.Add("Hotkey", "vRightKey Limit190")
	RightKey.OnEvent("Change", ChangeKey.Bind("RightKey", "d"))
	RightKey.Value := IniRead(ConfigFile, "Settings", "RightKey", "d")
	BuildStratagemKeyArray()
	HotkeysGUI.Add("Text", "ys", "Note: input type has to be set to `"HOLD`" in game.")

	ChangeKey(SettingName, DefaultKey, GUIControlID, *) {
		Temp := StrReplace(GUIControlID.Value, "^!")
		if (Temp = "")
			GUIControlID.Value := DefaultKey
		else
			GUIControlID.Value := Temp
		IniWrite GUIControlID.Value, ConfigFile, "Settings", SettingName
		BuildStratagemKeyArray()
	}

	BuildStratagemKeyArray() {
		Global StratagemKeys := Array()
		StratagemKeys.Push(UpKey.Value)
		StratagemKeys.Push(DownKey.Value)
		StratagemKeys.Push(LeftKey.Value)
		StratagemKeys.Push(RightKey.Value)
	}

	Tab.UseTab(3)

	Temp := HotkeysGUI.Add("Text", "Section h18 w400", "Helldivers 2 Stratagem AutoHotkey v2 script with GUI")
	Temp.SetFont("bold s10")
	HotkeysGUI.Add("Text", "xs", "Version 1.2")
	HotkeysGUI.Add("Link", "xs y+20", '<a href="https://github.com/Dazuzi/HD2StratHotkeysGUI">https://github.com/Dazuzi/HD2StratHotkeysGUI</a>')

	Tab.UseTab()

	try Profiles := IniRead(ConfigFile, "Profiles")
	catch
		Profiles := ""
	ProfileNames := Array()
	ProfileNames.Push("Default")
	Loop Parse, Profiles, "`n" {
		Key := StrSplit(A_LoopField, "=")
		if (Key[1] != "Default")
			ProfileNames.Push(Key[1])
	}

	HotkeysGUI.Add("Text", "Section", "Profile")
	Profile := HotkeysGUI.Add("DropDownList", "ys w180 Background4B4B4B cBABABA", ProfileNames)
	Profile.OnEvent("Change", ChangeProfile)
	Profile.Focus
	Temp := IniRead(ConfigFile, "Settings", "ActiveProfile", "Default")
	if (ProfileExists(Temp))
		Profile.Text := Temp
	else
		Profile.Text := "Default"
	AddProfile := HotkeysGUI.Add("Button", "ys w80 Background171717", "Add profile")
	AddProfile.OnEvent("Click", AddProfileClick)
	DeleteProfile := HotkeysGUI.Add("Button", "ys w80 Background171717", "Delete profile")
	DeleteProfile.OnEvent("Click", DeleteProfileClick)

	ChangeProfile

	ChangeProfile(*) {
		if (Profile.Text = "Default")
			DeleteProfile.Enabled := False
		else
			DeleteProfile.Enabled := True
		Global HotkeyStratagems := StrSplit(IniRead(ConfigFile, "Profiles", Profile.Text, "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"), " ")
		HotkeyNumlock.Text := " " Stratagems[HotkeyStratagems[1]].Name
		ButtonIcon(HotkeyNumlock.Hwnd, 1)
		HotkeyNumpadDiv.Text := " " Stratagems[HotkeyStratagems[2]].Name
		ButtonIcon(HotkeyNumpadDiv.Hwnd, 2)
		HotkeyNumpadMult.Text := " " Stratagems[HotkeyStratagems[3]].Name
		ButtonIcon(HotkeyNumpadMult.Hwnd, 3)
		HotkeyNumpadSub.Text := " " Stratagems[HotkeyStratagems[4]].Name
		ButtonIcon(HotkeyNumpadSub.Hwnd, 4)
		HotkeyNumpad7.Text := " " Stratagems[HotkeyStratagems[5]].Name
		ButtonIcon(HotkeyNumpad7.Hwnd, 5)
		HotkeyNumpad8.Text := " " Stratagems[HotkeyStratagems[6]].Name
		ButtonIcon(HotkeyNumpad8.Hwnd, 6)
		HotkeyNumpad9.Text := " " Stratagems[HotkeyStratagems[7]].Name
		ButtonIcon(HotkeyNumpad9.Hwnd, 7)
		HotkeyNumpadAdd.Text := " " Stratagems[HotkeyStratagems[8]].Name
		ButtonIcon(HotkeyNumpadAdd.Hwnd, 8)
		HotkeyNumpad4.Text := " " Stratagems[HotkeyStratagems[9]].Name
		ButtonIcon(HotkeyNumpad4.Hwnd, 9)
		HotkeyNumpad5.Text := " " Stratagems[HotkeyStratagems[10]].Name
		ButtonIcon(HotkeyNumpad5.Hwnd, 10)
		HotkeyNumpad6.Text := " " Stratagems[HotkeyStratagems[11]].Name
		ButtonIcon(HotkeyNumpad6.Hwnd, 11)
		HotkeyNumpad1.Text := " " Stratagems[HotkeyStratagems[12]].Name
		ButtonIcon(HotkeyNumpad1.Hwnd, 12)
		HotkeyNumpad2.Text := " " Stratagems[HotkeyStratagems[13]].Name
		ButtonIcon(HotkeyNumpad2.Hwnd, 13)
		HotkeyNumpad3.Text := " " Stratagems[HotkeyStratagems[14]].Name
		ButtonIcon(HotkeyNumpad3.Hwnd, 14)
		HotkeyNumpadEnter.Text := " " Stratagems[HotkeyStratagems[15]].Name
		ButtonIcon(HotkeyNumpadEnter.Hwnd, 15)
		HotkeyNumpad0.Text := " " Stratagems[HotkeyStratagems[16]].Name
		ButtonIcon(HotkeyNumpad0.Hwnd, 16)
		HotkeyNumpadDot.Text := " " Stratagems[HotkeyStratagems[17]].Name
		ButtonIcon(HotkeyNumpadDot.Hwnd, 17)
		IniWrite Profile.Text, ConfigFile, "Settings", "ActiveProfile"
	}

	AddProfileClick(*) {
		ProfileName := "MyNewProfile"
		TryAgain:
		NewProfile := InputBox("Enter an alphanumeric name for a new profile:", "HELLDIVERS™ 2 Stratagem Hotkeys", "h100", ProfileName)
		if (NewProfile.Result = "Cancel")
			Return
		else if (StrLen(NewProfile.Value) > 64) {
			if (MsgBox("The profile name can be a maximum of 64 characters long, please try again.", "HELLDIVERS™ 2 Stratagem Hotkeys", "RC IconX 8192") = "Retry") {
				ProfileName := NewProfile.Value
				Goto TryAgain
			}
			else
				Return
		}
		else if (IsAlnum(NewProfile.Value)) {
			if (ProfileExists(NewProfile.Value)) {
				if (MsgBox("A profile called `"" NewProfile.Value "`" already exists, please try again.", "HELLDIVERS™ 2 Stratagem Hotkeys", "RC IconX 8192") = "Retry") {
					ProfileName := NewProfile.Value
					Goto TryAgain
				}
				else
					Return
			}
			ProfileNames.Push(NewProfile.Value)
			Profile.Delete
			Profile.Add(ProfileNames)
			Profile.Text := NewProfile.Value
			SaveHotkeys
			ChangeProfile
		}
		else if (MsgBox("The profile name can only contain letters and numbers, please try again.", "HELLDIVERS™ 2 Stratagem Hotkeys", "RC IconX 8192") = "Retry") {
			ProfileName := NewProfile.Value
			Goto TryAgain
		}
	}

	ProfileExists(NewProfile) {
		for (Profile in ProfileNames) {
			if (Profile = NewProfile)
				Return True
		}
		Return False
	}

	DeleteProfileClick(*) {
		if (MsgBox("Do you really want to delete `"" Profile.Text "`" profile?", "HELLDIVERS™ 2 Stratagem Hotkeys", "YN Icon? 8192") = "No")
			Return
		IniDelete ConfigFile, "Profiles", Profile.Text
		for (p in ProfileNames) {
			if (p = Profile.Text)
				ProfileNames.RemoveAt(A_Index)
		}
		Profile.Delete(Profile.Value)
		Profile.Text := "Default"
		ChangeProfile
	}

	HotkeysGUI.OnEvent("Close", (*) => ExitApp())
	HotkeysGUI.Show()

	Global StratagemMenu := Menu()
	CommonSubmenu := Menu()
	MissionSubmenu := Menu()
	OffensiveSubmenu := Menu()
	SupplySubmenu := Menu()
	DefensiveSubmenu := Menu()
	For (Stratagem in Stratagems) {
		Switch Stratagem.Category {
			Case "Common":
				CommonSubmenu.Add(Stratagem.Name, StratagemMenuHandler.Bind(A_Index))
				Try CommonSubmenu.SetIcon(Stratagem.Name, "resources\" Stratagem.Icon,,28)
			Case "Mission":
				MissionSubmenu.Add(Stratagem.Name, StratagemMenuHandler.Bind(A_Index))
				Try MissionSubmenu.SetIcon(Stratagem.Name, "resources\" Stratagem.Icon,,28)
			Case "Offensive":
				OffensiveSubmenu.Add(Stratagem.Name, StratagemMenuHandler.Bind(A_Index))
				Try OffensiveSubmenu.SetIcon(Stratagem.Name, "resources\" Stratagem.Icon,,28)
			Case "Supply":
				SupplySubmenu.Add(Stratagem.Name, StratagemMenuHandler.Bind(A_Index))
				Try SupplySubmenu.SetIcon(Stratagem.Name, "resources\" Stratagem.Icon,,28)
			Case "Defensive":
				DefensiveSubmenu.Add(Stratagem.Name, StratagemMenuHandler.Bind(A_Index))
				Try DefensiveSubmenu.SetIcon(Stratagem.Name, "resources\" Stratagem.Icon,,28)
		}
	}
	StratagemMenu.Add("No Stratagem", StratagemMenuHandler.Bind(1))
	Try StratagemMenu.SetIcon("No Stratagem", "resources\No Stratagem.png",,28)
	StratagemMenu.Add("Common", CommonSubmenu)
	Try StratagemMenu.SetIcon("Common", "resources\Reinforce.png",,28)
	StratagemMenu.Add("Mission", MissionSubmenu)
	Try StratagemMenu.SetIcon("Mission", "resources\SSSD Delivery.png",,28)
	StratagemMenu.Add("Offensive", OffensiveSubmenu)
	Try StratagemMenu.SetIcon("Offensive", "resources\Eagle 500kg Bomb.png",,28)
	StratagemMenu.Add("Supply", SupplySubmenu)
	Try StratagemMenu.SetIcon("Supply", "resources\Commando.png",,28)
	StratagemMenu.Add("Defensive", DefensiveSubmenu)
	Try StratagemMenu.SetIcon("Defensive", "resources\Anti-Tank Mines.png",,28)
	StratagemMenu.SetColor("BABABA", true)
}

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[1] > 1)
NumLock::PlayKeys(Stratagems[HotkeyStratagems[1]].Keys)

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[2] > 1)
NumpadDiv::PlayKeys(Stratagems[HotkeyStratagems[2]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[3] > 1)
NumpadMult::PlayKeys(Stratagems[HotkeyStratagems[3]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[4] > 1)
NumpadSub::PlayKeys(Stratagems[HotkeyStratagems[4]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[5] > 1)
Numpad7::
NumpadHome::PlayKeys(Stratagems[HotkeyStratagems[5]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[6] > 1)
Numpad8::
NumpadUp::PlayKeys(Stratagems[HotkeyStratagems[6]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[7] > 1)
Numpad9::
NumpadPgUp::PlayKeys(Stratagems[HotkeyStratagems[7]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[8] > 1)
NumpadAdd::PlayKeys(Stratagems[HotkeyStratagems[8]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[9] > 1)
Numpad4::
NumpadLeft::PlayKeys(Stratagems[HotkeyStratagems[9]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[10] > 1)
Numpad5::
NumpadClear::PlayKeys(Stratagems[HotkeyStratagems[10]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[11] > 1)
Numpad6::
NumpadRight::PlayKeys(Stratagems[HotkeyStratagems[11]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[12] > 1)
Numpad1::
NumpadEnd::PlayKeys(Stratagems[HotkeyStratagems[12]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[13] > 1)
Numpad2::
NumpadDown::PlayKeys(Stratagems[HotkeyStratagems[13]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[14] > 1)
Numpad3::
NumpadPgDn::PlayKeys(Stratagems[HotkeyStratagems[14]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[15] > 1)
NumpadEnter::PlayKeys(Stratagems[HotkeyStratagems[15]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[16] > 1)
Numpad0::
NumpadIns::PlayKeys(Stratagems[HotkeyStratagems[16]].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyStratagems[17] > 1)
NumpadDot::
NumpadDel::PlayKeys(Stratagems[HotkeyStratagems[17]].Keys)
#HotIf

PlayKeys(Keys) {
	MinDelay := MinimumDelay.Value
	MaxDelay := MinimumDelay.Value*2
	Send "{" StratagemKey.Text " down}"
	Sleep Random(MinDelay, MaxDelay)
	For (i in Keys) {
		Send "{" StratagemKeys[i] " down}"
		Sleep Random(MinDelay, MaxDelay)
		Send "{" StratagemKeys[i] " up}"
		Sleep Random(MinDelay, MaxDelay)
	}
	Send "{" StratagemKey.Text " up}"
}