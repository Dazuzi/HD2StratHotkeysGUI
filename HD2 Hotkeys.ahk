/*
Helldivers 2 Stratagem AutoHotkey v2 script with GUI
Version 2.2

https://github.com/Dazuzi/HD2StratHotkeysGUI
*/

;@Ahk2Exe-SetName HELLDIVERS™ 2 Stratagem Hotkeys
;@Ahk2Exe-SetDescription Helldivers 2 Stratagem AutoHotkey v2 script with GUI
;@Ahk2Exe-SetFileVersion 2.2.0.0

#Requires Autohotkey v2
#SingleInstance Force
#NoTrayIcon

StratagemArray	:= [{Category:"No Stratagem", Name:"No Stratagem", Icon:"No Stratagem.png", Throwable:False, Keys:[]},												;1 = Up, 2 = Down, 3 = Left & 4 = Right
{Category:"Common",		Name:"Reinforce",						TTSName:"Reinforce",					Icon:"Reinforce.png",					Throwable:True,		Keys:[1, 2, 4, 3, 1]},
{Category:"Common",		Name:"SoS Beacon",						TTSName:"S O S Beacon",					Icon:"SoS Beacon.png",					Throwable:True,		Keys:[1, 2, 4, 1]},
{Category:"Common",		Name:"Resupply",						TTSName:"Resupply",						Icon:"Resupply.png",					Throwable:True,		Keys:[2, 2, 1, 4]},
{Category:"Common",		Name:"Eagle Rearm",						TTSName:"Eagle Rearm",					Icon:"Eagle Rearm.png",					Throwable:False,	Keys:[1, 1, 3, 1, 4]},
{Category:"Mission",	Name:"SSSD Delivery",					TTSName:"S S S D Delivery",				Icon:"SSSD Delivery.png",				Throwable:True,		Keys:[2, 2, 2, 1, 1]},
{Category:"Mission",	Name:"Prospecting Drill",				TTSName:"Prospecting Drill",			Icon:"Prospecting Drill.png",			Throwable:False,	Keys:[2, 2, 3, 4, 2, 2]},
{Category:"Mission",	Name:"Super Earth Flag",				TTSName:"Super Earth Flag",				Icon:"Super Earth Flag.png",			Throwable:False,	Keys:[2, 1, 2, 1]},
{Category:"Mission",	Name:"NUX-223 Hellbomb",				TTSName:"Hellbomb",						Icon:"Hellbomb.png",					Throwable:True,		Keys:[2, 1, 3, 2, 1, 4, 2, 1]},
{Category:"Mission",	Name:"Upload Data",						TTSName:"Upload Data",					Icon:"Upload Data.png",					Throwable:False,	Keys:[3, 4, 1, 1, 1]},
{Category:"Mission",	Name:"Seismic Probe",					TTSName:"Seismic Probe",				Icon:"Seismic Probe.png",				Throwable:False,	Keys:[1, 1, 3, 4, 2, 2]},
{Category:"Mission",	Name:"Orbital Illumination Flare",		TTSName:"Orbital Illumination Flare",	Icon:"Orbital Illumination Flare.png",	Throwable:True,		Keys:[4, 4, 3, 3]},
{Category:"Mission",	Name:"SEAF Artillery",					TTSName:"S E A F Artillery",			Icon:"SEAF Artillery.png",				Throwable:True,		Keys:[4, 1, 1, 2]},
{Category:"Mission",	Name:"Dark Fluid Vessel",				TTSName:"Dark Fluid Vessel",			Icon:"Dark Fluid Vessel.png",			Throwable:True,		Keys:[1, 3, 4, 2, 1, 1]},
{Category:"Mission",	Name:"Tectonic Drill",					TTSName:"Tectonic Drill",				Icon:"Tectonic Drill.png",				Throwable:False,	Keys:[1, 2, 1, 2, 1, 2]},
{Category:"Mission",	Name:"Hive Breaker Drill",				TTSName:"Hive Breaker Drill",			Icon:"Hive Breaker Drill.png",			Throwable:False,	Keys:[3, 1, 2, 4, 2, 2]},
{Category:"Offensive",	Name:"Eagle 500kg Bomb",				TTSName:"Eagle 500K G Bomb",			Icon:"Eagle 500kg Bomb.png",			Throwable:True,		Keys:[1, 4, 2, 2, 2]},
{Category:"Offensive",	Name:"Orbital Gatling Barrage",			TTSName:"Orbital Gatling Barrage",		Icon:"Orbital Gatling Barrage.png",		Throwable:True,		Keys:[4, 2, 3, 1, 1]},
{Category:"Offensive",	Name:"Eagle Airstrike",					TTSName:"Eagle Airstrike",				Icon:"Eagle Airstrike.png",				Throwable:True,		Keys:[1, 4, 2, 4]},
{Category:"Offensive",	Name:"Orbital Walking Barrage",			TTSName:"Orbital Walking Barrage",		Icon:"Orbital Walking Barrage.png",		Throwable:True,		Keys:[4, 2, 4, 2, 4, 2]},
{Category:"Offensive",	Name:"Eagle Strafing Run",				TTSName:"Eagle Strafing Run",			Icon:"Eagle Strafing Run.png",			Throwable:True,		Keys:[1, 4, 4]},
{Category:"Offensive",	Name:"Orbital EMS Strike",				TTSName:"Orbital E M S Strike",			Icon:"Orbital EMS Strike.png",			Throwable:True,		Keys:[4, 4, 3, 2]},
{Category:"Offensive",	Name:"Eagle Smoke Strike",				TTSName:"Eagle Smoke Strike",			Icon:"Eagle Smoke Strike.png",			Throwable:True,		Keys:[1, 4, 1, 2]},
{Category:"Offensive",	Name:"Orbital Gas Strike",				TTSName:"Orbital Gas Strike",			Icon:"Orbital Gas Strike.png",			Throwable:True,		Keys:[4, 4, 2, 4]},
{Category:"Offensive",	Name:"Orbital Railcannon Strike",		TTSName:"Orbital Railcannon Strike",	Icon:"Orbital Railcannon Strike.png",	Throwable:True,		Keys:[4, 1, 2, 2, 4]},
{Category:"Offensive",	Name:"Eagle Cluster Bomb",				TTSName:"Eagle Cluster Bomb",			Icon:"Eagle Cluster Bomb.png",			Throwable:True,		Keys:[1, 4, 2, 2, 4]},
{Category:"Offensive",	Name:"Orbital Smoke Strike",			TTSName:"Orbital Smoke Strike",			Icon:"Orbital Smoke Strike.png",		Throwable:True,		Keys:[4, 4, 2, 1]},
{Category:"Offensive",	Name:"Orbital Airburst Strike",			TTSName:"Orbital Airbust Strike",		Icon:"Orbital Airburst Strike.png",		Throwable:True,		Keys:[4, 4, 4]},
{Category:"Offensive",	Name:"Orbital Laser",					TTSName:"Orbital Laser",				Icon:"Orbital Laser.png",				Throwable:True,		Keys:[4, 2, 1, 4, 2]},
{Category:"Offensive",	Name:"Orbital Precision Strike",		TTSName:"Orbital Precision Strike",		Icon:"Orbital Precision Strike.png",	Throwable:True,		Keys:[4, 4, 1]},
{Category:"Offensive",	Name:"Orbital 380mm HE Barrage",		TTSName:"Orbital 380M M H E Barrage",	Icon:"Orbital 380MM HE Barrage.png",	Throwable:True,		Keys:[4, 2, 1, 1, 3, 2, 2]},
{Category:"Offensive",	Name:"Eagle Napalm Airstrike",			TTSName:"Eagle Napalm Airstrike",		Icon:"Eagle Napalm Airstrike.png",		Throwable:True,		Keys:[1, 4, 2, 1]},
{Category:"Offensive",	Name:"Orbital 120mm HE Barrage",		TTSName:"Orbital 120M M H E Barrage",	Icon:"Orbital 120MM HE Barrage.png",	Throwable:True,		Keys:[4, 4, 2, 3, 4, 2]},
{Category:"Offensive",	Name:"Eagle 110mm Rocket Pods",			TTSName:"Eagle 110M M Rocket Pods",		Icon:"Eagle 110MM Rocket Pods.png",		Throwable:True,		Keys:[1, 4, 1, 3]},
{Category:"Offensive",	Name:"Orbital Napalm Barrage",			TTSName:"Orbital Napalm Barrage",		Icon:"Orbital Napalm Barrage.png",		Throwable:True,		Keys:[4, 4, 2, 3, 4, 1]},
{Category:"Supply",		Name:"MLS-4X Commando",					TTSName:"Commando",						Icon:"Commando.png",					Throwable:True,		Keys:[2, 3, 1, 2, 4]},
{Category:"Supply",		Name:"EXO-49 Emancipator Exosuit",		TTSName:"Emancipator Exosuit",			Icon:"Emancipator Exosuit.png",			Throwable:True,		Keys:[3, 2, 4, 1, 3, 2, 1]},
{Category:"Supply",		Name:"M-105 Stalwart",					TTSName:"Stalwart",						Icon:"Stalwart.png",					Throwable:True,		Keys:[2, 3, 2, 1, 1, 3]},
{Category:"Supply",		Name:"AC-8 Autocannon",					TTSName:"Autocannon",					Icon:"Autocannon.png",					Throwable:True,		Keys:[2, 3, 2, 1, 1, 4]},
{Category:"Supply",		Name:"EXO-45 Patriot Exosuit",			TTSName:"Patriot Exosuit",				Icon:"Patriot Exosuit.png",				Throwable:True,		Keys:[3, 2, 4, 1, 3, 2, 2]},
{Category:"Supply",		Name:"MG-206 Heavy Machine Gun",		TTSName:"Heavy Machine Gun",			Icon:"Heavy Machine Gun.png",			Throwable:True,		Keys:[2, 3, 1, 2, 2]},
{Category:"Supply",		Name:"SH-32 Shield Generator Pack",		TTSName:"Shield Generator Pack",		Icon:"Shield Generator Pack.png",		Throwable:True,		Keys:[2, 1, 3, 4, 3, 4]},
{Category:"Supply",		Name:"RL-77 Airburst Rocket Launcher",	TTSName:"Airburst Rocket Launcher",		Icon:"Airburst Rocket Launcher.png",	Throwable:True,		Keys:[2, 1, 1, 3, 4]},
{Category:"Supply",		Name:"RS-422 Railgun",					TTSName:"Railgun",						Icon:"Railgun.png",						Throwable:True,		Keys:[2, 4, 2, 1, 3, 4]},
{Category:"Supply",		Name:"LAS-98 Laser Cannon",				TTSName:"Laser Cannon",					Icon:"Laser Cannon.png",				Throwable:True,		Keys:[2, 3, 2, 1, 3]},
{Category:"Supply",		Name:"ARC-3 Arc Thrower",				TTSName:"Arc Thrower",					Icon:"Arc Thrower.png",					Throwable:True,		Keys:[2, 4, 2, 1, 3, 3]},
{Category:"Supply",		Name:"AX/AR-23 `"Guard Dog`"",			TTSName:"Guard Dog",					Icon:"Guard Dog.png",					Throwable:True,		Keys:[2, 1, 3, 1, 4, 2]},
{Category:"Supply",		Name:"FAF-14 Spear",					TTSName:"Spear",						Icon:"Spear.png",						Throwable:True,		Keys:[2, 2, 1, 2, 2]},
{Category:"Supply",		Name:"GL-21 Grenade Launcher",			TTSName:"Grenade Launcher",				Icon:"Grenade Launcher.png",			Throwable:True,		Keys:[2, 3, 1, 3, 2]},
{Category:"Supply",		Name:"MG-43 Machine Gun",				TTSName:"Machine Gun",					Icon:"Machine Gun.png",					Throwable:True,		Keys:[2, 3, 2, 1, 4]},
{Category:"Supply",		Name:"SH-20 Ballistic Shield Backpack",	TTSName:"Ballistic Shield Backpack",	Icon:"Ballistic Shield Backpack.png",	Throwable:True,		Keys:[2, 3, 2, 2, 1, 3]},
{Category:"Supply",		Name:"B-1 Supply Pack",					TTSName:"Supply Pack",					Icon:"Supply Pack.png",					Throwable:True,		Keys:[2, 3, 2, 1, 1, 2]},
{Category:"Supply",		Name:"FLAM-40 Flamethrower",			TTSName:"Flame thrower",				Icon:"Flamethrower.png",				Throwable:True,		Keys:[2, 3, 1, 2, 1]},
{Category:"Supply",		Name:"AX/LAS-5 `"Guard Dog`" Rover",	TTSName:"Guard Dog Rover",				Icon:"Guard Dog Rover.png",				Throwable:True,		Keys:[2, 1, 3, 1, 4, 4]},
{Category:"Supply",		Name:"GR-8 Recoilless Rifle",			TTSName:"Recoilless Rifle",				Icon:"Recoilless Rifle.png",			Throwable:True,		Keys:[2, 3, 4, 4, 3]},
{Category:"Supply",		Name:"LIFT-850 Jump Pack",				TTSName:"Jump Pack",					Icon:"Jump Pack.png",					Throwable:True,		Keys:[2, 1, 1, 2, 1]},
{Category:"Supply",		Name:"APW-1 Anti-Materiel Rifle",		TTSName:"Anti-Material Rifle",			Icon:"Anti-Material Rifle.png",			Throwable:True,		Keys:[2, 3, 4, 1, 2]},
{Category:"Supply",		Name:"EAT-17 Expendable Anti-Tank",		TTSName:"Expendable Anti-Tank",			Icon:"Expendable Anti-Tank.png",		Throwable:True,		Keys:[2, 2, 3, 1, 4]},
{Category:"Supply",		Name:"LAS-99 Quasar Cannon",			TTSName:"Quasar Cannon",				Icon:"Quasar Cannon.png",				Throwable:True,		Keys:[2, 2, 1, 3, 4]},
{Category:"Defensive",	Name:"Anti-Tank Mines",					TTSName:"Anti-Tank Mines",				Icon:"Anti-Tank Mines.png",				Throwable:True,		Keys:[2, 3, 1, 1]},
{Category:"Defensive",	Name:"FX-12 Shield Generator Relay",	TTSName:"Shield Generator Relay",		Icon:"Shield Generator Relay.png",		Throwable:True,		Keys:[2, 2, 3, 4, 3, 4]},
{Category:"Defensive",	Name:"A/M-23 EMS Mortar Sentry",		TTSName:"E M S Mortar Sentry",			Icon:"EMS Mortar Sentry.png",			Throwable:True,		Keys:[2, 1, 4, 2, 4]},
{Category:"Defensive",	Name:"A/MLS-4X Rocket Sentry",			TTSName:"Rocket Sentry",				Icon:"Rocket Sentry.png",				Throwable:True,		Keys:[2, 1, 4, 4, 3]},
{Category:"Defensive",	Name:"A/G-16 Gatling Sentry",			TTSName:"Gatling Sentry",				Icon:"Gatling Sentry.png",				Throwable:True,		Keys:[2, 1, 4, 3]},
{Category:"Defensive",	Name:"A/ARC-3 Tesla Tower",				TTSName:"Tesla Tower",					Icon:"Tesla Tower.png",					Throwable:True,		Keys:[2, 1, 4, 1, 3, 4]},
{Category:"Defensive",	Name:"A/M-12 Mortar Sentry",			TTSName:"Mortar Sentry",				Icon:"Mortar Sentry.png",				Throwable:True,		Keys:[2, 1, 4, 4, 2]},
{Category:"Defensive",	Name:"MD-6 Anti-Personnel Minefield",	TTSName:"Anti-Personnel Minefield",		Icon:"Anti-Personnel Minefield.png",	Throwable:True,		Keys:[2, 3, 1, 4]},
{Category:"Defensive",	Name:"A/MG-43 Machine Gun Sentry",		TTSName:"Machine Gun Sentry",			Icon:"Machine Gun Sentry.png",			Throwable:True,		Keys:[2, 1, 4, 4, 1]},
{Category:"Defensive",	Name:"A/AC-8 Autocannon Sentry",		TTSName:"Autocannon Sentry",			Icon:"Autocannon Sentry.png",			Throwable:True,		Keys:[2, 1, 4, 1, 3, 1]},
{Category:"Defensive",	Name:"MD-I4 Incendiary Mines",			TTSName:"Incendiary Mines",				Icon:"Incendiary Mines.png",			Throwable:True,		Keys:[2, 3, 3, 2]},
{Category:"Defensive",	Name:"E/MG-101 HMG Emplacement",		TTSName:"H M G Emplacement",			Icon:"HMG Emplacement.png",				Throwable:True,		Keys:[2, 1, 3, 4, 4, 3]}]

ConstructGUI

ConstructGUI() {
	Try TraySetIcon("resources\HD2.png")
	HotkeyGUI := Gui()
	HotkeyGUI.Title := "HELLDIVERS™ 2 Stratagem Hotkeys"
	HotkeyGUI.BackColor := "171717"
	HotkeyGUI.SetFont("cBABABA")
	Try HotkeyGUI.Add("Picture", "w776 h-1", "resources\HD2 Banner.png")
	Tab := HotkeyGUI.Add("Tab3", "Background383333 cE1CB00", [" Hotkeys ", " Settings ", " About "])
	Tab.SetFont("s10")

	Tab.UseTab(1)
	ButtonArray := Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	IconArray := Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	HotkeyGUI.Add("Text", "Section w180", "Numlock")
	HotkeyGUI.Add("Text", "x+m wp", "NumpadDiv")
	HotkeyGUI.Add("Text", "x+m wp", "NumpadMult")
	HotkeyGUI.Add("Text", "x+m wp", "NumpadSub")
	ButtonArray[1] := HotkeyGUI.Add("Button", "xs w180 h54 left background383333")
	ButtonArray[1].OnEvent("Click", ShowStratagemMenu.Bind(1))
	ButtonArray[2] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[2].OnEvent("Click", ShowStratagemMenu.Bind(2))
	ButtonArray[3] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[3].OnEvent("Click", ShowStratagemMenu.Bind(3))
	ButtonArray[4] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[4].OnEvent("Click", ShowStratagemMenu.Bind(4))
	HotkeyGUI.Add("Text", "xs y+10 w180", "Numpad7 / NumpadHome")
	HotkeyGUI.Add("Text", "x+m wp", "Numpad8 / NumpadUp")
	HotkeyGUI.Add("Text", "x+m wp", "Numpad9 / NumpadPgUp")
	HotkeyGUI.Add("Text", "x+m wp", "NumpadAdd")
	ButtonArray[5] := HotkeyGUI.Add("Button", "xs w180 h54 left background383333")
	ButtonArray[5].OnEvent("Click", ShowStratagemMenu.Bind(5))
	ButtonArray[6] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[6].OnEvent("Click", ShowStratagemMenu.Bind(6))
	ButtonArray[7] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[7].OnEvent("Click", ShowStratagemMenu.Bind(7))
	ButtonArray[8] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[8].OnEvent("Click", ShowStratagemMenu.Bind(8))
	HotkeyGUI.Add("Text", "xs y+10 w180", "Numpad4 / NumpadLeft")
	HotkeyGUI.Add("Text", "x+m wp", "Numpad5 / NumpadClear")
	HotkeyGUI.Add("Text", "x+m wp", "Numpad6 / NumpadRight")
	ButtonArray[9] := HotkeyGUI.Add("Button", "xs w180 h54 left background383333")
	ButtonArray[9].OnEvent("Click", ShowStratagemMenu.Bind(9))
	ButtonArray[10] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[10].OnEvent("Click", ShowStratagemMenu.Bind(10))
	ButtonArray[11] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[11].OnEvent("Click", ShowStratagemMenu.Bind(11))
	HotkeyGUI.Add("Text", "xs y+10 w180", "Numpad1 / NumpadEnd")
	HotkeyGUI.Add("Text", "x+m wp", "Numpad2 / NumpadDown")
	HotkeyGUI.Add("Text", "x+m wp", "Numpad3 / NumpadPgDn")
	HotkeyGUI.Add("Text", "x+m wp", "NumpadEnter")
	ButtonArray[12] := HotkeyGUI.Add("Button", "xs w180 h54 left background383333")
	ButtonArray[12].OnEvent("Click", ShowStratagemMenu.Bind(12))
	ButtonArray[13] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[13].OnEvent("Click", ShowStratagemMenu.Bind(13))
	ButtonArray[14] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[14].OnEvent("Click", ShowStratagemMenu.Bind(14))
	ButtonArray[15] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[15].OnEvent("Click", ShowStratagemMenu.Bind(15))
	HotkeyGUI.Add("Text", "xs y+10 w180", "Numpad0 / NumpadIns")
	HotkeyGUI.Add("Text", "x+m wp")
	HotkeyGUI.Add("Text", "x+m wp", "NumpadDot / NumpadDel")
	ButtonArray[16] := HotkeyGUI.Add("Button", "xs w180 h54 left background383333")
	ButtonArray[16].OnEvent("Click", ShowStratagemMenu.Bind(16))
	HotkeyGUI.Add("Text", "x+m wp h58")
	ButtonArray[17] := HotkeyGUI.Add("Button", "x+m wp h54 left background383333")
	ButtonArray[17].OnEvent("Click", ShowStratagemMenu.Bind(17))

	Tab.UseTab(2)
	HotkeyGUI.Add("Text", "Section y+10", "Minimum press/click delay")
	HotkeyGUI.Add("Edit", "ys yp-3 Limit3 Number w75 Background4B4B4B cBABABA").OnEvent("Change", ChangeSetting.Bind("MinimumDelay"))
	Global MinimumDelay := HotkeyGUI.Add("UpDown", "vMinUpDown Range0-999", IniRead("HD2 Config.ini", "Settings", "MinimumDelay", "40"))
	MinimumDelay.OnEvent("Change", ChangeSetting.Bind("MinimumDelay"))
	HotkeyGUI.Add("Text", "ys", "milliseconds (Default: 40)")
	HotkeyGUI.Add("Text", "xs", "If the macro is failing to input the stratagem properly, try increasing this value.")
	HotkeyGUI.Add("Text", "xs y+30", "Stratagem keys:")
	HotkeyGUI.Add("Text", "Section", "Open stratagem list")
	Global StratagemKey := HotkeyGUI.Add("DropDownList", "ys yp-4 Background4B4B4B cBABABA", ["Alt", "Control", "Shift"])
	StratagemKey.OnEvent("Change", ChangeKey.Bind("StratagemKey", "Control"))
	StratagemKey.Value := IniRead("HD2 Config.ini", "Settings", "StratagemKey", 2)
	HotkeyGUI.Add("Text", "ys", "Note: input type has to be set to `"HOLD`" in game.")
	HotkeyGUI.Add("Text", "Section xs y+15 w90", "Up")
	UpKey := HotkeyGUI.Add("Hotkey", "vUpKey ys yp-4 Limit190", IniRead("HD2 Config.ini", "Settings", "UpKey", "w"))
	UpKey.OnEvent("Change", ChangeKey.Bind("UpKey", "w"))
	HotkeyGUI.Add("Text", "Section xs y+11 w90", "Down")
	DownKey := HotkeyGUI.Add("Hotkey", "vDownKey ys yp-4 Limit190", IniRead("HD2 Config.ini", "Settings", "DownKey", "s"))
	DownKey.OnEvent("Change", ChangeKey.Bind("DownKey", "s"))
	HotkeyGUI.Add("Text", "Section xs y+11 w90", "Left")
	LeftKey := HotkeyGUI.Add("Hotkey", "vLeftKey ys yp-4 Limit190", IniRead("HD2 Config.ini", "Settings", "LeftKey", "a"))
	LeftKey.OnEvent("Change", ChangeKey.Bind("LeftKey", "a"))
	HotkeyGUI.Add("Text", "Section xs y+11 w90", "Right")
	RightKey := HotkeyGUI.Add("Hotkey", "vRightKey ys yp-4 Limit190", IniRead("HD2 Config.ini", "Settings", "RightKey", "d"))
	RightKey.OnEvent("Change", ChangeKey.Bind("RightKey", "d"))

	Global KeyArray := Array(UpKey.Value, DownKey.Value, LeftKey.Value, RightKey.Value)
	Try {
		Global SAPI := ComObject("SAPI.SpVoice")
		SAPI.Rate := 1
		SAPI.Volume := 100
		Voices := Array()
		For Voice in SAPI.GetVoices
			Voices.Push(Voice.GetDescription)
		Global TextToSpeech := HotkeyGUI.Add("CheckBox", "vTextToSpeech Section xs y+30", "Read out loud activated stratagem's name")
		TextToSpeech.OnEvent("Click", ChangeSetting.Bind("TextToSpeech"))
		TextToSpeech.Value := IniRead("HD2 Config.ini", "Settings", "TextToSpeech", 0)
		HotkeyGUI.Add("Text", "Section y+15 xp+18", "Voice")
		Voice := HotkeyGUI.Add("DropDownList", "ys yp-4 w300 Background4B4B4B cBABABA", Voices)
		Voice.OnEvent("Change", ChangeVoice.Bind("Voice"))
		Voice.Value := IniRead("HD2 Config.ini", "Settings", "Voice", 1)
		If !TextToSpeech.Value
			Voice.Enabled := False
	}
	AutoThrowTooltips := HotkeyGUI.Add("CheckBox", "vAutoThrowTooltips Section xm+12 y+30", "Show `"Throw Automatically`" help tips")
	AutoThrowTooltips.OnEvent("Click", ChangeSetting.Bind("AutoThrowTooltips"))
	AutoThrowTooltips.Value := IniRead("HD2 Config.ini", "Settings", "AutoThrowTooltips", 1)

	Tab.UseTab(3)
	HotkeyGUI.Add("Text", "Section h18 w400", "Helldivers 2 Stratagem AutoHotkey v2 script with GUI").SetFont("bold s10")
	HotkeyGUI.Add("Text", "xs", "Version 2.2")
	HotkeyGUI.Add("Link", "xs y+20", '<a href="https://github.com/Dazuzi/HD2StratHotkeysGUI">https://github.com/Dazuzi/HD2StratHotkeysGUI</a>')

	Tab.UseTab()
	ProfileArray := Array("Default")
	Try {
		Loop Parse, IniRead("HD2 Config.ini", "Profiles"), "`n" {
			Profile := StrSplit(A_LoopField, "=")[1]
			If Profile != "Default"
				ProfileArray.Push(Profile)
		}
	}
	HotkeyGUI.Add("Text", "Section y+11", "Profile")
	ActiveProfile := HotkeyGUI.Add("DropDownList", "ys w180 yp-4 Background4B4B4B cBABABA", ProfileArray)
	ActiveProfile.OnEvent("Change", LoadProfile)
	ActiveProfile.Focus
	Try ActiveProfile.Text := IniRead("HD2 Config.ini", "Settings", "ActiveProfile", "Default")
	Catch
		ActiveProfile.Text := "Default"
	HotkeyGUI.Add("Button", "ys yp-1 w80 Background171717", "Add profile").OnEvent("Click", AddProfileClick)
	DeleteProfile := HotkeyGUI.Add("Button", "ys yp-1 w80 Background171717", "Delete profile")
	DeleteProfile.OnEvent("Click", DeleteProfileClick)
	LoadProfile

	HotkeyGUI.OnEvent("Close", (*) => ExitApp())
	HotkeyGUI.Show

	ModifyButton(ButtonHandle, Index) {
		ButtonArray[Index].Text := " " StratagemArray[HotkeyArray[Index]].Name
		If HotkeyArray[Index + 17]
			ButtonHandle.SetFont("italic")
		Else
			ButtonHandle.SetFont("")
		IL_Destroy(IconArray[Index])
		IconSize := 54 * A_ScreenDPI / 96
		ButtonImageList := Buffer(A_PtrSize + 20)
		Try {
			NewImageList := DllCall("ImageList_Create", "Int", IconSize, "Int", IconSize, "UInt", 0x21, "Int", 1, "Int", 1)
			NumPut("Ptr", NewImageList, "UInt", -2, "UInt", 0, "UInt", 0, "UInt", 0, "UInt", 0, ButtonImageList, 0)
			SendMessage(BCM_SETIMAGELIST := 5634, 0, ButtonImageList, ButtonHandle.Hwnd)
			IL_Add(NewImageList, "resources\" StratagemArray[HotkeyArray[Index]].Icon, 1)
			IconArray[Index] := NewImageList
		}
	}

	ShowStratagemMenu(HotkeyID, ButtonID, *) {
		If !StratagemArray[HotkeyArray[HotkeyID]].Throwable
			StratagemMenu.Disable("Throw Automatically")
		Else If HotkeyArray[HotkeyID + 17]
			StratagemMenu.Check("Throw Automatically")
		Global MenuIDs := Array(HotkeyID,ButtonID)
		Stratagem := StratagemArray[HotkeyArray[HotkeyID]]
		Category := StratagemArray[HotkeyArray[HotkeyID]].Category
		Switch Category {
			Case "No Stratagem":SelectedMenu := StratagemMenu
			Case "Common":SelectedMenu := CommonSubmenu
			Case "Mission":SelectedMenu := MissionSubmenu
			Case "Offensive":SelectedMenu := OffensiveSubmenu
			Case "Supply":SelectedMenu := SupplySubmenu
			Case "Defensive":SelectedMenu := DefensiveSubmenu
		}
		SelectedMenu.Check(StratagemMenuName(Stratagem))
		ControlGetPos &x, &y,, &h, ButtonID
		StratagemMenu.Show(x, y + h)
		StratagemMenu.Enable("Throw Automatically")
		StratagemMenu.Uncheck("Throw Automatically")
		SelectedMenu.Uncheck(StratagemMenuName(Stratagem))
	}

	StratagemMenuHandler(Index, *) {
		AutothrowIndex := MenuIDs[1] + 17
		If Index = 0 {
			If HotkeyArray[AutothrowIndex] {
				HotkeyArray[AutothrowIndex] := 0
				MenuIDs[2].SetFont("")
			}
			Else {
				HotkeyArray[AutothrowIndex] := 1
				MenuIDs[2].SetFont("italic")
				If AutoThrowTooltips.Value {
					ControlGetPos &x, &y,, &h, MenuIDs[2]
					ToolTip("Note: you must have FIRE key bound to Right Mouse Button.", x, y - 25)
					SetTimer () => ToolTip(), -5000
				}
			}
		}
		Else {
			If !StratagemArray[Index].Throwable && HotkeyArray[AutothrowIndex] {
				HotkeyArray[AutothrowIndex] := 0
				MenuIDs[2].SetFont("")
				If AutoThrowTooltips.Value {
					ControlGetPos &x, &y,, &h, MenuIDs[2]
					If (Index > 1)
						ToolTip(StratagemArray[Index].Name " cannot be thrown, autothrow disabled.", x, y - 25)
					Else
						ToolTip("Autothrow disabled.", x, y - 25)
					SetTimer () => ToolTip(), -5000
				}
			}
			HotkeyArray[MenuIDs[1]] := Index
			ModifyButton(MenuIDs[2], MenuIDs[1])
			If TextToSpeech.Value
				Try SAPI.Speak(StratagemArray[Index].TTSName, 1)
		}
		SaveActiveProfile
	}

	ChangeSetting(SettingName, ControlID, *) {
		IniWrite ControlID.Value, "HD2 Config.ini", "Settings", SettingName
		If TextToSpeech.Value
			Voice.Enabled := True
		Else
			Voice.Enabled := False
	}

	ChangeKey(SettingName, DefaultKey, ControlID, *) {
		ControlID.Value := StrReplace(ControlID.Value, "^!")
		If ControlID.Value = ""
			ControlID.Value := DefaultKey
		IniWrite ControlID.Value, "HD2 Config.ini", "Settings", SettingName
		KeyArray := Array(UpKey.Value, DownKey.Value, LeftKey.Value, RightKey.Value)
	}

	ChangeVoice(SettingName, ControlID, *) {
		IniWrite ControlID.Value, "HD2 Config.ini", "Settings", SettingName
		SAPI.Voice := SAPI.GetVoices().Item(ControlID.Value - 1)
		If TextToSpeech.Value
			SAPI.Speak(ControlID.Text, 1)
	}

	SaveActiveProfile() {
		Stratagems := ""
		For Stratagem in HotkeyArray
			Stratagems := Stratagems " " Stratagem
		IniWrite LTrim(Stratagems), "HD2 Config.ini", "Profiles", ActiveProfile.Text
	}

	LoadProfile(*) {
		If ActiveProfile.Text = "Default"
			DeleteProfile.Enabled := False
		Else
			DeleteProfile.Enabled := True
		Global HotkeyArray := StrSplit(IniRead("HD2 Config.ini", "Profiles", ActiveProfile.Text, "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0"), " ")
		ModifyButton(ButtonArray[1], 1)
		ModifyButton(ButtonArray[2], 2)
		ModifyButton(ButtonArray[3], 3)
		ModifyButton(ButtonArray[4], 4)
		ModifyButton(ButtonArray[5], 5)
		ModifyButton(ButtonArray[6], 6)
		ModifyButton(ButtonArray[7], 7)
		ModifyButton(ButtonArray[8], 8)
		ModifyButton(ButtonArray[9], 9)
		ModifyButton(ButtonArray[10], 10)
		ModifyButton(ButtonArray[11], 11)
		ModifyButton(ButtonArray[12], 12)
		ModifyButton(ButtonArray[13], 13)
		ModifyButton(ButtonArray[14], 14)
		ModifyButton(ButtonArray[15], 15)
		ModifyButton(ButtonArray[16], 16)
		ModifyButton(ButtonArray[17], 17)
		IniWrite ActiveProfile.Text, "HD2 Config.ini", "Settings", "ActiveProfile"
	}

	AddProfileClick(*) {
		NewProfile := Object
		NewProfile.Value := "MyNewProfile"
		TryAgain:
		NewProfile := InputBox("Enter an alphanumeric name for a new profile:", "HELLDIVERS™ 2 Stratagem Hotkeys", "h100", NewProfile.Value)
		If (NewProfile.Result = "Cancel")
			Return
		Else If StrLen(NewProfile.Value) > 64 {
			If MsgBox("The profile name can be a maximum of 64 characters long, please try again.", "HELLDIVERS™ 2 Stratagem Hotkeys", "RC IconX 8192") = "Retry"
				Goto TryAgain
			Return
		}
		If ProfileExists(NewProfile.Value) > 0 {
			If MsgBox("A profile called `"" NewProfile.Value "`" already exists, please try again.", "HELLDIVERS™ 2 Stratagem Hotkeys", "RC IconX 8192") = "Retry"
				Goto TryAgain
			Return
		}
		Else If IsAlnum(NewProfile.Value) {
			ProfileArray.Push(NewProfile.Value)
			ActiveProfile.Add(Array(NewProfile.Value))
			ActiveProfile.Text := NewProfile.Value
			SaveActiveProfile
			LoadProfile
		}
		Else If MsgBox("The profile name can only contain letters and numbers, please try again.", "HELLDIVERS™ 2 Stratagem Hotkeys", "RC IconX 8192") = "Retry"
			Goto TryAgain
	}

	ProfileExists(ProfileName) {
		For Profile in ProfileArray {
			If Profile = ProfileName
				Return A_Index
		}
		Return 0
	}

	DeleteProfileClick(*) {
		If MsgBox("Do you really want to delete `"" ActiveProfile.Text "`" profile?", "HELLDIVERS™ 2 Stratagem Hotkeys", "YN Icon? 8192") = "No"
			Return
		IniDelete "HD2 Config.ini", "Profiles", ActiveProfile.Text
		ProfileArray.RemoveAt(ProfileExists(ActiveProfile.Text))
		ActiveProfile.Delete(ActiveProfile.Value)
		ActiveProfile.Value := 1
		LoadProfile
	}

	StratagemMenu := Menu()
	CommonSubmenu := Menu()
	MissionSubmenu := Menu()
	OffensiveSubmenu := Menu()
	SupplySubmenu := Menu()
	DefensiveSubmenu := Menu()
	StratagemMenu.Add("Throw automatically", StratagemMenuHandler.Bind(0))
	Try StratagemMenu.SetIcon("Throw automatically", "resources\Throw.png",,28)
	StratagemMenu.Add
	For Stratagem in StratagemArray {
		Switch Stratagem.Category {
			Case "No Stratagem":AddMenuItem(StratagemMenu, Stratagem)
			Case "Common":AddMenuItem(CommonSubmenu, Stratagem)
			Case "Mission":AddMenuItem(MissionSubmenu, Stratagem)
			Case "Offensive": AddMenuItem(OffensiveSubmenu, Stratagem)
			Case "Supply": AddMenuItem(SupplySubmenu, Stratagem)
			Case "Defensive": AddMenuItem(DefensiveSubmenu, Stratagem)
		}
	}
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

	AddMenuItem(Submenu, Stratagem) {
		MenuItemName := StratagemMenuName(Stratagem)
		Submenu.Add(MenuItemName, StratagemMenuHandler.Bind(A_Index))
		Try Submenu.SetIcon(MenuItemName, "resources\" Stratagem.Icon,,28)
	}

	StratagemMenuName(Stratagem) {
		if Stratagem.Keys.Length < 1
			Return MenuItemName := Stratagem.Name
		MenuItemName := Stratagem.Name "	"
		For Key in Stratagem.Keys {
			Switch Key {
				Case 1: MenuItemName := MenuItemName " 🡅"
				Case 2: MenuItemName := MenuItemName " 🡇"
				Case 3: MenuItemName := MenuItemName " 🡄"
				Case 4: MenuItemName := MenuItemName " 🡆"
			}
		}
		Return MenuItemName
	}
}

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[1] > 1)
NumLock::PlayKeys(1)

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[2] > 1)
NumpadDiv::PlayKeys(2)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[3] > 1)
NumpadMult::PlayKeys(3)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[4] > 1)
NumpadSub::PlayKeys(4)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[5] > 1)
Numpad7::
NumpadHome::PlayKeys(5)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[6] > 1)
Numpad8::
NumpadUp::PlayKeys(6)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[7] > 1)
Numpad9::
NumpadPgUp::PlayKeys(7)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[8] > 1)
NumpadAdd::PlayKeys(8)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[9] > 1)
Numpad4::
NumpadLeft::PlayKeys(9)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[10] > 1)
Numpad5::
NumpadClear::PlayKeys(10)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[11] > 1)
Numpad6::
NumpadRight::PlayKeys(11)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[12] > 1)
Numpad1::
NumpadEnd::PlayKeys(12)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[13] > 1)
Numpad2::
NumpadDown::PlayKeys(13)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[14] > 1)
Numpad3::
NumpadPgDn::PlayKeys(14)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[15] > 1)
NumpadEnter::PlayKeys(15)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[16] > 1)
Numpad0::
NumpadIns::PlayKeys(16)
#HotIf

#HotIf (WinActive("HELLDIVERS™ 2")) && (HotkeyArray[17] > 1)
NumpadDot::
NumpadDel::PlayKeys(17)
#HotIf

PlayKeys(HotkeyID) {
	StratagemID := HotkeyArray[HotkeyID]
	If TextToSpeech.Value
		Try SAPI.Speak(StratagemArray[StratagemID].TTSName, 1)
	Keys := StratagemArray[StratagemID].Keys
	MinDelay := MinimumDelay.Value
	MaxDelay := MinDelay*2
	Send "{" StratagemKey.Text " down}"
	Sleep Random(MinDelay, MaxDelay)
	For Key in Keys {
		Send "{" KeyArray[Key] " down}"
		Sleep Random(MinDelay, MaxDelay)
		Send "{" KeyArray[Key] " up}"
		Sleep Random(MinDelay, MaxDelay)
	}
	Send "{" StratagemKey.Text " up}"
	If HotkeyArray[HotkeyID + 17] {
		Sleep Random(MinDelay, MaxDelay)
		MouseClick "Left",,,,, "Down"
		Sleep Random(MinDelay, MaxDelay)
		MouseClick "Left",,,,, "Up"
	}
}