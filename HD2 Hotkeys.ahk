/*
Helldivers 2 Stratagem AutoHotkey v2 script with GUI
Version 1.1

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

	Tab := HotkeysGUI.Add("Tab3", "Background383333 cE1CB00", ["Hotkeys", "Settings", "About"])
	Tab.SetFont("bold")
	Tab.UseTab(1)

	HotkeysGUI.Add("Text", "Section " ColumnWidth, "Numlock")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "NumpadDiv")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "NumpadMult")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "NumpadSub")
	Global HotkeyNumlock := HotkeysGUI.Add("DropDownList", "xs Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumlock.OnEvent("Change", SaveHotkeys)
	Global HotkeyNumpadDiv := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpadDiv.OnEvent("Change", SaveHotkeys)
	Global HotkeyNumpadMult := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpadMult.OnEvent("Change", SaveHotkeys)
	Global HotkeyNumpadSub := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpadSub.OnEvent("Change", SaveHotkeys)

	HotkeysGUI.Add("Text", "xs y+25 " ColumnWidth, "Numpad7 / NumpadHome")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "Numpad8 / NumpadUp")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "Numpad9 / NumpadPgUp")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "NumpadAdd")
	Global HotkeyNumpad7 := HotkeysGUI.Add("DropDownList", "xs Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpad7.OnEvent("Change", SaveHotkeys)
	Global HotkeyNumpad8 := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpad8.OnEvent("Change", SaveHotkeys)
	Global HotkeyNumpad9 := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpad9.OnEvent("Change", SaveHotkeys)
	Global HotkeyNumpadAdd := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpadAdd.OnEvent("Change", SaveHotkeys)

	HotkeysGUI.Add("Text", "xs y+25 " ColumnWidth, "Numpad4 / NumpadLeft")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "Numpad5 / NumpadClear")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "Numpad6 / NumpadRight")
	Global HotkeyNumpad4 := HotkeysGUI.Add("DropDownList", "xs Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpad4.OnEvent("Change", SaveHotkeys)
	Global HotkeyNumpad5 := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpad5.OnEvent("Change", SaveHotkeys)
	Global HotkeyNumpad6 := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpad6.OnEvent("Change", SaveHotkeys)

	HotkeysGUI.Add("Text", "xs y+25 " ColumnWidth, "Numpad1 / NumpadEnd")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "Numpad2 / NumpadDown")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "Numpad3 / NumpadPgDn")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "NumpadEnter")
	Global HotkeyNumpad1 := HotkeysGUI.Add("DropDownList", "xs Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpad1.OnEvent("Change", SaveHotkeys)
	Global HotkeyNumpad2 := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpad2.OnEvent("Change", SaveHotkeys)
	Global HotkeyNumpad3 := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpad3.OnEvent("Change", SaveHotkeys)
	Global HotkeyNumpadEnter := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpadEnter.OnEvent("Change", SaveHotkeys)

	HotkeysGUI.Add("Text", "xs y+25 " ColumnWidth, "Numpad0 / NumpadIns")
	HotkeysGUI.Add("Text", "x+m " ColumnWidth)
	HotkeysGUI.Add("Text", "x+m " ColumnWidth, "NumpadDot / NumpadDel")
	Global HotkeyNumpad0 := HotkeysGUI.Add("DropDownList", "xs Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpad0.OnEvent("Change", SaveHotkeys)
	HotkeysGUI.Add("Text", "x+m " ColumnWidth)
	Global HotkeyNumpadDot := HotkeysGUI.Add("DropDownList", "x+m Background4B4B4B cBABABA " ColumnWidth, StratagemNames)
	HotkeyNumpadDot.OnEvent("Change", SaveHotkeys)

	SaveHotkeys(*) {
		IniWrite HotkeyNumlock.Value " " HotkeyNumpadDiv.Value " " HotkeyNumpadMult.Value " " HotkeyNumpadSub.Value " " HotkeyNumpad7.Value " " HotkeyNumpad8.Value " " HotkeyNumpad9.Value " " HotkeyNumpadAdd.Value " " HotkeyNumpad4.Value " " HotkeyNumpad5.Value " " HotkeyNumpad6.Value " " HotkeyNumpad1.Value " " HotkeyNumpad2.Value " " HotkeyNumpad3.Value " " HotkeyNumpadEnter.Value " " HotkeyNumpad0.Value " " HotkeyNumpadDot.Value, ConfigFile, "Profiles", Profile.Text
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
	HotkeysGUI.Add("Text", "xs", "Version 1.1")
	HotkeysGUI.Add("Link", "xs y+20", '<a href="https://github.com/Dazuzi/HD2StratHotkeysGUI">https://github.com/Dazuzi/HD2StratHotkeysGUI</a>')

	Tab.UseTab()

	Profiles := IniRead(ConfigFile, "Profiles")
	ProfileNames := Array()
	ProfileNames.Push("Default")
	Loop Parse, Profiles, "`n" {
		Key := StrSplit(A_LoopField, "=")
		if (Key[1] != "Default")
			ProfileNames.Push(Key[1])
	}

	HotkeysGUI.Add("Text", "Section", "Profile")
	Profile := HotkeysGUI.Add("DropDownList", "ys w150 Background4B4B4B cBABABA", ProfileNames)
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
		Settings := StrSplit(IniRead(ConfigFile, "Profiles", Profile.Text, "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"), " ")
		HotkeyNumlock.Value := Settings[1]
		HotkeyNumpadDiv.Value := Settings[2]
		HotkeyNumpadMult.Value := Settings[3]
		HotkeyNumpadSub.Value := Settings[4]
		HotkeyNumpad7.Value := Settings[5]
		HotkeyNumpad8.Value := Settings[6]
		HotkeyNumpad9.Value := Settings[7]
		HotkeyNumpadAdd.Value := Settings[8]
		HotkeyNumpad4.Value := Settings[9]
		HotkeyNumpad5.Value := Settings[10]
		HotkeyNumpad6.Value := Settings[11]
		HotkeyNumpad1.Value := Settings[12]
		HotkeyNumpad2.Value := Settings[13]
		HotkeyNumpad3.Value := Settings[14]
		HotkeyNumpadEnter.Value := Settings[15]
		HotkeyNumpad0.Value := Settings[16]
		HotkeyNumpadDot.Value := Settings[17]
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
		Profile.Delete(Profile.Value)
		Profile.Text := "Default"
		ChangeProfile
	}

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
