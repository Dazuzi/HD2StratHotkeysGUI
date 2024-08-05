/*
Helldivers 2 Stratagem AutoHotkey v2 script with GUI

https://github.com/Dazuzi/HD2StratHotkeysGUI
*/

#Requires Autohotkey v2
#SingleInstance Force

GameTitle	:= "HELLDIVERS™ 2"
ConfigFile	:= "HD2 Config.ini"
Stratagems	:= [{Name: "None"}
			, {Name: "Reinforce", Keys: ["1", "2", "4", "3", "1"]}
			, {Name: "SoS Beacon", Keys: ["1", "2", "4", "1"]}
			, {Name: "Resupply", Keys: ["2", "2", "1", "4"]}
			, {Name: "Eagle Rearm", Keys: ["1", "1", "3", "1", "4"]}
			, {Name: "SSSD Delivery", Keys: ["2", "2", "2", "1", "1"]}
			, {Name: "Prospecting Drill", Keys: ["2", "2", "3", "4", "2", "2"]}
			, {Name: "Super Earth Flag", Keys: ["2", "1", "2", "1"]}
			, {Name: "NUX-223 Hellbomb", Keys: ["2", "1", "3", "2", "1", "4", "2", "1"]}
			, {Name: "Upload Data", Keys: ["3", "4", "1", "1", "1"]}
			, {Name: "Seismic Probe", Keys: ["1", "1", "3", "4", "2", "2"]}
			, {Name: "Orbital Illumination Flare", Keys: ["4", "4", "3", "3"]}
			, {Name: "SEAF Artillery", Keys: ["4", "1", "1", "2"]}
			, {Name: "Dark Fluid Vessel", Keys: ["1", "3", "4", "2", "1", "1"]}
			, {Name: "Tectonic Drill", Keys: ["1", "2", "1", "2", "1", "2"]}
			, {Name: "Hive Breaker Drill", Keys: ["3", "1", "2", "4", "2", "2"]}
			, {Name: "Eagle 500kg Bomb", Keys: ["1", "4", "2", "2", "2"]}
			, {Name: "Orbital Gatling Barrage", Keys: ["4", "2", "3", "1", "1"]}
			, {Name: "Eagle Airstrike", Keys: ["1", "4", "2", "4"]}
			, {Name: "Orbital Walking Barrage", Keys: ["4", "2", "4", "2", "4", "2"]}
			, {Name: "Eagle Strafing Run", Keys: ["1", "4", "4"]}
			, {Name: "Orbital EMS Strike", Keys: ["4", "4", "3", "2"]}
			, {Name: "Eagle Smoke Strike", Keys: ["1", "4", "1", "2"]}
			, {Name: "Orbital Gas Strike", Keys: ["4", "4", "2", "4"]}
			, {Name: "Orbital Railcannon Strike", Keys: ["4", "1", "2", "2", "4"]}
			, {Name: "Eagle Cluster Bomb", Keys: ["1", "4", "2", "2", "4"]}
			, {Name: "Orbital Smoke Strike", Keys: ["4", "4", "2", "1"]}
			, {Name: "Orbital Airburst Strike", Keys: ["4", "4", "4"]}
			, {Name: "Orbital Laser", Keys: ["4", "2", "1", "4", "2"]}
			, {Name: "Orbital Precision Strike", Keys: ["4", "4", "1"]}
			, {Name: "Orbital 380mm HE Barrage", Keys: ["4", "2", "1", "1", "3", "2", "2"]}
			, {Name: "Eagle Napalm Airstrike", Keys: ["1", "4", "2", "1"]}
			, {Name: "Orbital 120mm HE Barrage", Keys: ["4", "4", "2", "3", "4", "2"]}
			, {Name: "Eagle 110mm Rocket Pods", Keys: ["1", "4", "1", "3"]}
			, {Name: "MLS-4X Commando", Keys: ["2", "3", "1", "2", "4"]}
			, {Name: "EXO-49 Emancipator Exosuit", Keys: ["3", "2", "4", "1", "3", "2", "1"]}
			, {Name: "M-105 Stalwart", Keys: ["2", "3", "2", "1", "1", "3"]}
			, {Name: "AC-8 Autocannon", Keys: ["2", "3", "2", "1", "1", "4"]}
			, {Name: "EXO-45 Patriot Exosuit", Keys: ["3", "2", "4", "1", "3", "2", "2"]}
			, {Name: "MG-206 Heavy Machine Gun", Keys: ["2", "3", "1", "2", "2"]}
			, {Name: "SH-32 Shield Generator Pack", Keys: ["2", "1", "3", "4", "3", "4"]}
			, {Name: "RL-77 Airburst Rocket Launcher", Keys: ["2", "1", "1", "3", "4"]}
			, {Name: "RS-422 Railgun", Keys: ["2", "4", "2", "1", "3", "4"]}
			, {Name: "LAS-98 Laser Cannon", Keys: ["2", "3", "2", "1", "3"]}
			, {Name: "ARC-3 Arc Thrower", Keys: ["2", "4", "2", "1", "3", "3"]}
			, {Name: "AX/AR-23 `"Guard Dog`"", Keys: ["2", "1", "3", "1", "4", "2"]}
			, {Name: "FAF-14 Spear", Keys: ["2", "2", "1", "2", "2"]}
			, {Name: "GL-21 Grenade Launcher", Keys: ["2", "3", "1", "3", "2"]}
			, {Name: "MG-43 Machine Gun", Keys: ["2", "3", "2", "1", "4"]}
			, {Name: "SH-20 Ballistic Shield Backpack", Keys: ["2", "3", "2", "2", "1", "3"]}
			, {Name: "B-1 Supply Pack", Keys: ["2", "3", "2", "1", "1", "2"]}
			, {Name: "FLAM-40 Flamethrower", Keys: ["2", "3", "1", "2", "1"]}
			, {Name: "AX/LAS-5 `"Guard Dog`" Rover", Keys: ["2", "1", "3", "1", "4", "4"]}
			, {Name: "GR-8 Recoilless Rifle", Keys: ["2", "3", "4", "4", "3"]}
			, {Name: "LIFT-850 Jump Pack", Keys: ["2", "1", "1", "2", "1"]}
			, {Name: "APW-1 Anti-Materiel Rifle", Keys: ["2", "3", "4", "1", "2"]}
			, {Name: "EAT-17 Expendable Anti-Tank", Keys: ["2", "2", "3", "1", "4"]}
			, {Name: "LAS-99 Quasar Cannon", Keys: ["2", "2", "1", "3", "4"]}
			, {Name: "FX-12 Shield Generator Relay", Keys: ["2", "2", "3", "4", "3", "4"]}
			, {Name: "A/M-23 EMS Mortar Sentry", Keys: ["2", "1", "4", "2", "4"]}
			, {Name: "A/MLS-4X Rocket Sentry", Keys: ["2", "1", "4", "4", "3"]}
			, {Name: "A/G-16 Gatling Sentry", Keys: ["2", "1", "4", "3"]}
			, {Name: "A/ARC-3 Tesla Tower", Keys: ["2", "1", "4", "1", "3", "4"]}
			, {Name: "A/M-12 Mortar Sentry", Keys: ["2", "1", "4", "4", "2"]}
			, {Name: "MD-6 Anti-Personnel Minefield", Keys: ["2", "3", "1", "4"]}
			, {Name: "A/MG-43 Machine Gun Sentry", Keys: ["2", "1", "4", "4", "1"]}
			, {Name: "A/AC-8 Autocannon Sentry", Keys: ["2", "1", "4", "1", "3", "1"]}
			, {Name: "MD-I4 Incendiary Mines", Keys: ["2", "3", "3", "2"]}
			, {Name: "E/MG-101 HMG Emplacement", Keys: ["2", "1", "3", "4", "4", "3"]}]

GUIConstructor().Show()

GUIConstructor() {
	StratagemNames := Array()
	for (Stratagem in Stratagems)
		StratagemNames.Push(Stratagem.Name)

	ColumnWidth := "w180"

	TraySetIcon("HD2.ico")
	HotkeysGUI := Gui()
	HotkeysGUI.Title := "HELLDIVERS™ 2 Stratagem Hotkeys"
	HotkeysGUI.BackColor := "171717"
	HotkeysGUI.SetFont("cFFFFFF")

	HotkeysGUI.Add("Picture", "w776 h-1", "HD2 Banner.png")

	Tab := HotkeysGUI.Add("Tab3", "Background383333", ["Hotkeys", "Settings"])
	Tab.UseTab(1)

	HotkeysGUI.Add("Text", "Section " ColumnWidth, "Numlock")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "NumpadDiv")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "NumpadMult")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "NumpadSub")
	Global HotkeyNumlock := HotkeysGUI.Add("DropDownList", "xs Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumlock.OnEvent("Change", HotkeyChange.Bind("Numlock"))
	HotkeyNumlock.Value := IniRead(ConfigFile, "Hotkeys", "Numlock", 1)
	Global HotkeyNumpadDiv := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpadDiv.OnEvent("Change", HotkeyChange.Bind("NumpadDiv"))
	HotkeyNumpadDiv.Value := IniRead(ConfigFile, "Hotkeys", "NumpadDiv", 1)
	Global HotkeyNumpadMult := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpadMult.OnEvent("Change", HotkeyChange.Bind("NumpadMult"))
	HotkeyNumpadMult.Value := IniRead(ConfigFile, "Hotkeys", "NumpadMult", 1)
	Global HotkeyNumpadSub := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpadSub.OnEvent("Change", HotkeyChange.Bind("NumpadSub"))
	HotkeyNumpadSub.Value := IniRead(ConfigFile, "Hotkeys", "NumpadSub", 1)

	HotkeysGUI.Add("Text", "xs y+25 " ColumnWidth, "Numpad7 / NumpadHome")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "Numpad8 / NumpadUp")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "Numpad9 / NumpadPgUp")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "NumpadAdd")
	Global HotkeyNumpad7 := HotkeysGUI.Add("DropDownList", "xs Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpad7.OnEvent("Change", HotkeyChange.Bind("Numpad7"))
	HotkeyNumpad7.Value := IniRead(ConfigFile, "Hotkeys", "Numpad7", 1)
	Global HotkeyNumpad8 := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpad8.OnEvent("Change", HotkeyChange.Bind("Numpad8"))
	HotkeyNumpad8.Value := IniRead(ConfigFile, "Hotkeys", "Numpad8", 1)
	Global HotkeyNumpad9 := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpad9.OnEvent("Change", HotkeyChange.Bind("Numpad9"))
	HotkeyNumpad9.Value := IniRead(ConfigFile, "Hotkeys", "Numpad9", 1)
	Global HotkeyNumpadAdd := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpadAdd.OnEvent("Change", HotkeyChange.Bind("NumpadAdd"))
	HotkeyNumpadAdd.Value := IniRead(ConfigFile, "Hotkeys", "NumpadAdd", 1)

	HotkeysGUI.Add("Text", "xs y+25 " ColumnWidth, "Numpad4 / NumpadLeft")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "Numpad5 / NumpadClear")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "Numpad6 / NumpadRight")
	Global HotkeyNumpad4 := HotkeysGUI.Add("DropDownList", "xs Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpad4.OnEvent("Change", HotkeyChange.Bind("Numpad4"))
	HotkeyNumpad4.Value := IniRead(ConfigFile, "Hotkeys", "Numpad4", 1)
	Global HotkeyNumpad5 := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpad5.OnEvent("Change", HotkeyChange.Bind("Numpad5"))
	HotkeyNumpad5.Value := IniRead(ConfigFile, "Hotkeys", "Numpad5", 1)
	Global HotkeyNumpad6 := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpad6.OnEvent("Change", HotkeyChange.Bind("Numpad6"))
	HotkeyNumpad6.Value := IniRead(ConfigFile, "Hotkeys", "Numpad6", 1)

	HotkeysGUI.Add("Text", "xs y+25 " ColumnWidth, "Numpad1 / NumpadEnd")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "Numpad2 / NumpadDown")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "Numpad3 / NumpadPgDn")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "NumpadEnter")
	Global HotkeyNumpad1 := HotkeysGUI.Add("DropDownList", "xs Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpad1.OnEvent("Change", HotkeyChange.Bind("Numpad1"))
	HotkeyNumpad1.Value := IniRead(ConfigFile, "Hotkeys", "Numpad1", 1)
	Global HotkeyNumpad2 := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpad2.OnEvent("Change", HotkeyChange.Bind("Numpad2"))
	HotkeyNumpad2.Value := IniRead(ConfigFile, "Hotkeys", "Numpad2", 1)
	Global HotkeyNumpad3 := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpad3.OnEvent("Change", HotkeyChange.Bind("Numpad3"))
	HotkeyNumpad3.Value := IniRead(ConfigFile, "Hotkeys", "Numpad3", 1)
	Global HotkeyNumpadEnter := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpadEnter.OnEvent("Change", HotkeyChange.Bind("NumpadEnter"))
	HotkeyNumpadEnter.Value := IniRead(ConfigFile, "Hotkeys", "NumpadEnter", 1)

	HotkeysGUI.Add("Text", "xs y+25 " ColumnWidth, "Numpad0 / NumpadIns")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth)
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "NumpadDot / NumpadDel")
	Global HotkeyNumpad0 := HotkeysGUI.Add("DropDownList", "xs Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpad0.OnEvent("Change", HotkeyChange.Bind("Numpad0"))
	HotkeyNumpad0.Value := IniRead(ConfigFile, "Hotkeys", "Numpad0", 1)
	HotkeysGUI.Add("Text", "x+m " ColumnWidth)
	Global HotkeyNumpadDot := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B " ColumnWidth, StratagemNames)
	HotkeyNumpadDot.OnEvent("Change", HotkeyChange.Bind("NumpadDot"))
	HotkeyNumpadDot.Value := IniRead(ConfigFile, "Hotkeys", "NumpadDot", 1)

	HotkeyChange(HotkeyName, GUIControlID, *) {
		IniWrite GUIControlID.Value, ConfigFile, "Hotkeys", HotkeyName
	}

	Tab.UseTab(2)
	HotkeysGUI.Add("Text", "Section", "Minimum press duration/delay between presses")
	MinimumDelayEdit := HotkeysGUI.Add("Edit", "ys Limit3 Number w75 Background4B4B4B")
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

	Global StratagemKey := HotkeysGUI.Add("DropDownList", "ys Background4B4B4B", ["Control", "Alt", "Shift"])
	StratagemKey.OnEvent("Change", ChangeKey.Bind("Stratagem", "Control"))
	StratagemKey.Value := IniRead(ConfigFile, "Settings", "StratagemKey", 1)
	Global UpKey := HotkeysGUI.Add("Hotkey", "vUpKey Limit190")
	UpKey.OnEvent("Change", ChangeKey.Bind("UpKey", "w"))
	UpKey.Value := IniRead(ConfigFile, "Settings", "UpKey", "w")
	Global DownKey := HotkeysGUI.Add("Hotkey", "vDownKey Limit190")
	DownKey.OnEvent("Change", ChangeKey.Bind("DownKey", "s"))
	DownKey.Value := IniRead(ConfigFile, "Settings", "DownKey", "s")
	Global LeftKey := HotkeysGUI.Add("Hotkey", "vLeftKey Limit190")
	LeftKey.OnEvent("Change", ChangeKey.Bind("LeftKey", "a"))
	LeftKey.Value := IniRead(ConfigFile, "Settings", "LeftKey", "a")
	Global RightKey := HotkeysGUI.Add("Hotkey", "vRightKey Limit190")
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

	Tab.UseTab()

	HotkeysGUI.OnEvent("Close", (*) => ExitApp())
	return HotkeysGUI
}

#HotIf (WinActive(GameTitle)) && (HotkeyNumlock.Value > 1)
NumLock::PlayKeys(Stratagems[HotkeyNumlock.Value].Keys)

#HotIf (WinActive(GameTitle)) && (HotkeyNumpadDiv.Value > 1)
NumpadDiv::PlayKeys(Stratagems[HotkeyNumpadDiv.Value].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyNumpadMult.Value > 1)
NumpadMult::PlayKeys(Stratagems[HotkeyNumpadMult.Value].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyNumpadSub.Value > 1)
NumpadSub::PlayKeys(Stratagems[HotkeyNumpadSub.Value].Keys)
#HotIf


#HotIf (WinActive(GameTitle)) && (HotkeyNumpad7.Value > 1)
Numpad7::
NumpadHome::PlayKeys(Stratagems[HotkeyNumpad7.Value].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyNumpad8.Value > 1)
Numpad8::
NumpadUp::PlayKeys(Stratagems[HotkeyNumpad8.Value].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyNumpad9.Value > 1)
Numpad9::
NumpadPgUp::PlayKeys(Stratagems[HotkeyNumpad9.Value].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyNumpadAdd.Value > 1)
NumpadAdd::PlayKeys(Stratagems[HotkeyNumpadAdd.Value].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyNumpad4.Value > 1)
Numpad4::
NumpadLeft::PlayKeys(Stratagems[HotkeyNumpad4.Value].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyNumpad5.Value > 1)
Numpad5::
NumpadClear::PlayKeys(Stratagems[HotkeyNumpad5.Value].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyNumpad6.Value > 1)
Numpad6::
NumpadRight::PlayKeys(Stratagems[HotkeyNumpad6.Value].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyNumpad1.Value > 1)
Numpad1::
NumpadEnd::PlayKeys(Stratagems[HotkeyNumpad1.Value].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyNumpad2.Value > 1)
Numpad2::
NumpadDown::PlayKeys(Stratagems[HotkeyNumpad2.Value].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyNumpad3.Value > 1)
Numpad3::
NumpadPgDn::PlayKeys(Stratagems[HotkeyNumpad3.Value].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyNumpadEnter.Value > 1)
NumpadEnter::PlayKeys(Stratagems[HotkeyNumpadEnter.Value].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyNumpad0.Value > 1)
Numpad0::
NumpadIns::PlayKeys(Stratagems[HotkeyNumpad0.Value].Keys)
#HotIf

#HotIf (WinActive(GameTitle)) && (HotkeyNumpadDot.Value > 1)
NumpadDot::
NumpadDel::PlayKeys(Stratagems[HotkeyNumpadDot.Value].Keys)
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
