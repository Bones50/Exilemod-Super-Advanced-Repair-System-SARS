private ["_vehicle", "_allHitpoints", "_hitpointNames", "_totalRepairList", "_totalSalvageList", "_wheelRepairList", "_wheelSalvageList", "_tempLabel", "_noWheels", "_tempExpression", "_tempMenu"];

_vehicle = cursorTarget;
_allHitpoints = getAllHitPointsDamage _vehicle;
_hitpointNames = _allHitpoints select 0;
_tempMenu = [["Repair Menu",true]];
_tempSubMenuWheels = [["Wheel Menu",true]];
_tempSubMenuWindows = [["Window Menu",true]];

/////////Wheels Menus
_wheelReplaceList = [];
_wheelRepairList = [];
_wheelSalvageList = [];

{
	_wheel = ["wheel", _x] call bis_fnc_instring;
	if(_wheel) then
	{
		_damage = _vehicle getHitPointDamage _x;
		if (_damage == 1) then 
		{
			_wheelReplaceList pushback _x;
		} else
		{
			if (_damage > .49 && _damage < 1) then
			{
			_wheelRepairList pushback _x;
			} else 
			{
			_wheelSalvageList pushback _x;
			};
		};
	};
}forEach _hitpointNames;

//Wheels Replace

{
	_tempLabel = _x;
	_noWheels = getnumber (configfile >> "cfgvehicles" >> (typeof _vehicle) >> "numberPhysicalWheels");
	if (_noWheels == 8) then 
		{
			if (_x == "HitRFWheel") then {_tempLabel = "Replace Right Front Wheel"};
			if (_x == "HitRF2Wheel") then {_tempLabel = "Replace Right Front Wheel 2"};
			if (_x == "HitRMWheel") then {_tempLabel = "Replace Right Rear Wheel 2"};
			if (_x == "HitRBWheel") then {_tempLabel = "Replace Right Rear Wheel"};
			if (_x == "HitLFWheel") then {_tempLabel = "Replace Left Front Wheel"};
			if (_x == "HitLF2Wheel") then {_tempLabel = "Replace Left Front Wheel 2"};
			if (_x == "HitLMWheel") then {_tempLabel = "Replace Left Rear Wheel 2"};
			if (_x == "HitLBWheel") then {_tempLabel = "Replace Left Rear Wheel"};
		};

	if (_noWheels == 4) then 
		{
			if (_x == "HitRFWheel") then {_tempLabel = "Replace Right Front Wheel"};
			if (_x == "HitRF2Wheel") then {_tempLabel = "Replace Right Rear Wheel"};
			if (_x == "HitLFWheel") then {_tempLabel = "Replace Left Front Wheel"};
			if (_x == "HitLF2Wheel") then {_tempLabel = "Replace Left Rear Wheel"};
			if (_x == "HitRMWheel") then {_tempLabel = "error"};
			if (_x == "HitLMWheel") then {_tempLabel = "error"};
			if (_x == "HitLBWheel") then {_tempLabel = "error"};
			if (_x == "HitRBWheel") then {_tempLabel = "error"};
		};

	if (_noWheels == 6) then 
		{
			if (_x == "HitRFWheel") then {_tempLabel = "Replace Right Front Wheel"};
			if (_x == "HitRF2Wheel") then {_tempLabel = "Replace Right Middle Wheel"};
			if (_x == "HitRMWheel") then {_tempLabel = "Replace Right Rear Wheel"};
			if (_x == "HitLFWheel") then {_tempLabel = "Replace Left Front Wheel"};
			if (_x == "HitLF2Wheel") then {_tempLabel = "Replace Left Middle Wheel"};
			if (_x == "HitLMWheel") then {_tempLabel = "Replace Left Rear Wheel"};
			if (_x == "HitLBWheel") then {_tempLabel = "error"};
			if (_x == "HitRBWheel") then {_tempLabel = "error"};
		};
	if !(_tempLabel == "error") then
		{
			_tempStatement = [];
			_action = "ReplaceCarWheel";
			_item = _x;
			_tempStatement pushback _action;
			_tempStatement pushback _item;
			_temp2 = format ["%1 Call salvage_setup", _tempStatement];
			_tempExpression = [];
			_tempExpression pushback _tempLabel;
			_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
			_tempSubMenuWheels pushback _tempExpression;
		};
}forEach _wheelReplaceList;

//wheel Repair
{
	_tempLabel = _x;
	_noWheels = getnumber (configfile >> "cfgvehicles" >> (typeof _vehicle) >> "numberPhysicalWheels");
	if (_noWheels == 8) then 
		{
			if (_x == "HitRFWheel") then {_tempLabel = "Repair Right Front Wheel"};
			if (_x == "HitRF2Wheel") then {_tempLabel = "Repair Right Front Wheel 2"};
			if (_x == "HitRMWheel") then {_tempLabel = "Repair Right Rear Wheel 2"};
			if (_x == "HitRBWheel") then {_tempLabel = "Repair Right Rear Wheel"};
			if (_x == "HitLFWheel") then {_tempLabel = "Repair Left Front Wheel"};
			if (_x == "HitLF2Wheel") then {_tempLabel = "Repair Left Front Wheel 2"};
			if (_x == "HitLMWheel") then {_tempLabel = "Repair Left Rear Wheel 2"};
			if (_x == "HitLBWheel") then {_tempLabel = "Repair Left Rear Wheel"};
		};

	if (_noWheels == 4) then 
		{
			if (_x == "HitRFWheel") then {_tempLabel = "Repair Right Front Wheel"};
			if (_x == "HitRF2Wheel") then {_tempLabel = "Repair Right Rear Wheel"};
			if (_x == "HitLFWheel") then {_tempLabel = "Repair Left Front Wheel"};
			if (_x == "HitLF2Wheel") then {_tempLabel = "Repair Left Rear Wheel"};
			if (_x == "HitRMWheel") then {_tempLabel = "error"};
			if (_x == "HitLMWheel") then {_tempLabel = "error"};
			if (_x == "HitLBWheel") then {_tempLabel = "error"};
			if (_x == "HitRBWheel") then {_tempLabel = "error"};
		};

	if (_noWheels == 6) then 
		{
			if (_x == "HitRFWheel") then {_tempLabel = "Repair Right Front Wheel"};
			if (_x == "HitRF2Wheel") then {_tempLabel = "Repair Right Middle Wheel"};
			if (_x == "HitRMWheel") then {_tempLabel = "Repair Right Rear Wheel"};
			if (_x == "HitLFWheel") then {_tempLabel = "Repair Left Front Wheel"};
			if (_x == "HitLF2Wheel") then {_tempLabel = "Repair Left Middle Wheel"};
			if (_x == "HitLMWheel") then {_tempLabel = "Repair Left Rear Wheel"};
			if (_x == "HitLBWheel") then {_tempLabel = "error"};
			if (_x == "HitRBWheel") then {_tempLabel = "error"};
		};
	if !(_tempLabel == "error") then
		{
			_tempStatement = [];
			_action = "RepairCarWheel";
			_item = _x;
			_tempStatement pushback _action;
			_tempStatement pushback _item;
			_temp2 = format ["%1 Call salvage_setup", _tempStatement];
			_tempExpression = [];
			_tempExpression pushback _tempLabel;
			_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
			_tempSubMenuWheels pushback _tempExpression;
		};
}forEach _wheelRepairList;

//wheel Salvage
{
	_tempLabel = _x;
	_noWheels = getnumber (configfile >> "cfgvehicles" >> (typeof _vehicle) >> "numberPhysicalWheels");
	if (_noWheels == 8) then 
		{
			if (_x == "HitRFWheel") then {_tempLabel = "Salvage Right Front Wheel"};
			if (_x == "HitRF2Wheel") then {_tempLabel = "Salvage Right Front Wheel 2"};
			if (_x == "HitRMWheel") then {_tempLabel = "Salvage	Right Rear Wheel 2"};
			if (_x == "HitRBWheel") then {_tempLabel = "Salvage Right Rear Wheel"};
			if (_x == "HitLFWheel") then {_tempLabel = "Salvage Left Front Wheel"};
			if (_x == "HitLF2Wheel") then {_tempLabel = "Salvage Left Front Wheel 2"};
			if (_x == "HitLMWheel") then {_tempLabel = "Salvage Left Rear Wheel 2"};
			if (_x == "HitLBWheel") then {_tempLabel = "Salvage Left Rear Wheel"};
		};

	if (_noWheels == 4) then 
		{
			if (_x == "HitRFWheel") then {_tempLabel = "Salvage Right Front Wheel"};
			if (_x == "HitRF2Wheel") then {_tempLabel = "Salvage Right Rear Wheel"};
			if (_x == "HitLFWheel") then {_tempLabel = "Salvage Left Front Wheel"};
			if (_x == "HitLF2Wheel") then {_tempLabel = "Salvage Left Rear Wheel"};
			if (_x == "HitRMWheel") then {_tempLabel = "error"};
			if (_x == "HitLMWheel") then {_tempLabel = "error"};
			if (_x == "HitLBWheel") then {_tempLabel = "error"};
			if (_x == "HitRBWheel") then {_tempLabel = "error"};
		};

	if (_noWheels == 6) then 
		{
			if (_x == "HitRFWheel") then {_tempLabel = "Salvage Right Front Wheel"};
			if (_x == "HitRF2Wheel") then {_tempLabel = "Salvage Right Middle Wheel"};
			if (_x == "HitRMWheel") then {_tempLabel = "Salvage Right Rear Wheel"};
			if (_x == "HitLFWheel") then {_tempLabel = "Salvage Left Front Wheel"};
			if (_x == "HitLF2Wheel") then {_tempLabel = "Salvage Left Middle Wheel"};
			if (_x == "HitLMWheel") then {_tempLabel = "Salvage Left Rear Wheel"};
			if (_x == "HitLBWheel") then {_tempLabel = "error"};
			if (_x == "HitRBWheel") then {_tempLabel = "error"};
		};
	if !(_tempLabel == "error") then
		{
			_tempStatement = [];
			_action = "salvageCarWheel";
			_item = _x;
			_tempStatement pushback _action;
			_tempStatement pushback _item;
			_temp2 = format ["%1 Call salvage_setup", _tempStatement];
			_tempExpression = [];
			_tempExpression pushback _tempLabel;
			_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
			_tempSubMenuWheels pushback _tempExpression;
		};
}foreach _wheelSalvageList;

//////////Rotors Menu

_rotorReplaceList = [];
_rotorRepairList = [];
_rotorSalvageList = [];

{
	_rotor = ["rotor", _x] call bis_fnc_instring;
	if(_rotor) then
	{
		_damage = _vehicle getHitPointDamage _x;
		if (_damage == 1) then 
		{
			_rotorReplaceList pushback _x;
		} else
		{
			if (_damage > .49 && _damage < 1) then
			{
			_rotorRepairList pushback _x;
			} else 
			{
			_rotorSalvageList pushback _x;
			};
		};
	};
}forEach _hitpointNames;

//rotor Replace

{
	_tempLabel = _x;
	if (_x == "HitHRotor") then {_tempLabel = "Replace Main Rotor"};
	if (_x == "HitVRotor") then {_tempLabel = "Replace Tail Rotor"};

	if !(_tempLabel == "error") then
		{
			_tempStatement = [];
			_action = _tempLabel;
			_item = _x;
			_tempStatement pushback _action;
			_tempStatement pushback _item;
			_temp2 = format ["%1 Call salvage_setup", _tempStatement];
			_tempExpression = [];
			_tempExpression pushback _tempLabel;
			_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
			_tempMenu pushback _tempExpression;
		};
}forEach _rotorReplaceList;

//rotor Repair
{
	_tempLabel = _x;
	if (_x == "HitHRotor") then {_tempLabel = "Repair Main Rotor"};
	if (_x == "HitVRotor") then {_tempLabel = "Repair Tail Rotor"};
	if !(_tempLabel == "error") then
		{
			_tempStatement = [];
			_action = "repairRotor";
			_item = _x;
			_tempStatement pushback _action;
			_tempStatement pushback _item;
			_temp2 = format ["%1 Call salvage_setup", _tempStatement];
			_tempExpression = [];
			_tempExpression pushback _tempLabel;
			_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
			_tempMenu pushback _tempExpression;
		};
}forEach _rotorRepairList;

//rotor Salvage
{
	_tempLabel = _x;
	if (_x == "HitHRotor") then {_tempLabel = "Salvage Main Rotor"};
	if (_x == "HitVRotor") then {_tempLabel = "Salvage Tail Rotor"};
	if !(_tempLabel == "error") then
		{
			_tempStatement = [];
			_action = _tempLabel;
			_item = _x;
			_tempStatement pushback _action;
			_tempStatement pushback _item;
			_temp2 = format ["%1 Call salvage_setup", _tempStatement];
			_tempExpression = [];
			_tempExpression pushback _tempLabel;
			_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
			_tempMenu pushback _tempExpression;
		};
}foreach _rotorSalvageList;

///////////Glass Menu

_glassReplaceList = [];
_glassRepairList = [];

{
	_glass = ["glass", _x] call bis_fnc_instring;
	if(_glass) then
	{
		_damage = _vehicle getHitPointDamage _x;
		if (_damage == 1) then 
		{
			_glassReplaceList pushback _x;
		} else
		{
			if (_damage > 0) then
			{
			_glassRepairList pushback _x;
			};
		};
	};
}forEach _hitpointNames;

//Glass Replace

{
	_tempLabel = _x;
	if (_x == "HitGlass1") then {_tempLabel = "Replace Window 1"};
	if (_x == "HitGlass2") then {_tempLabel = "Replace Window 2"};
	if (_x == "HitGlass3") then {_tempLabel = "Replace Window 3"};
	if (_x == "HitGlass4") then {_tempLabel = "Replace Window 4"};
	if (_x == "HitGlass5") then {_tempLabel = "Replace Window 5"};
	if (_x == "HitGlass6") then {_tempLabel = "Replace Window 6"};
	if (_x == "HitGlass7") then {_tempLabel = "Replace Window 7"};
	if (_x == "HitGlass8") then {_tempLabel = "Replace Window 8"};
	if (_x == "HitGlass9") then {_tempLabel = "Replace Window 9"};
	if (_x == "HitGlass10") then {_tempLabel = "Replace Window 10"};
	if (_x == "HitGlass11") then {_tempLabel = "Replace Window 11"};
	if (_x == "HitGlass12") then {_tempLabel = "Replace Window 12"};
	if (_x == "HitGlass13") then {_tempLabel = "Replace Window 13"};
	if (_x == "HitGlass14") then {_tempLabel = "Replace Window 14"};
	if (_x == "HitGlass15") then {_tempLabel = "Replace Window 15"};
	if (_x == "HitGlass16") then {_tempLabel = "Replace Window 16"};
	if (_x == "HitGlass17") then {_tempLabel = "Replace Window 17"};
	if (_x == "HitRGlass") then {_tempLabel = "Replace Window Right"};
	if (_x == "HitLGlass") then {_tempLabel = "Replace Window Left"};
	if !(_tempLabel == "error") then
		{
			_tempStatement = [];
			_action = "replaceglass";
			_item = _x;
			_tempStatement pushback _action;
			_tempStatement pushback _item;
			_temp2 = format ["%1 Call salvage_setup", _tempStatement];
			_tempExpression = [];
			_tempExpression pushback _tempLabel;
			_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
			_tempSubMenuWindows pushback _tempExpression;
		};
}forEach _glassReplaceList;

//glass Repair
{
	_tempLabel = _x;
	if (_x == "HitGlass1") then {_tempLabel = "Repair Window 1"};
	if (_x == "HitGlass1A") then {_tempLabel = "Repair Window 1a"};
	if (_x == "HitGlass1B") then {_tempLabel = "Repair Window 1b"};
	if (_x == "HitGlass2") then {_tempLabel = "Repair Window 2"};
	if (_x == "HitGlass3") then {_tempLabel = "Repair Window 3"};
	if (_x == "HitGlass4") then {_tempLabel = "Repair Window 4"};
	if (_x == "HitGlass5") then {_tempLabel = "Repair Window 5"};
	if (_x == "HitGlass6") then {_tempLabel = "Repair Window 6"};
	if (_x == "HitGlass7") then {_tempLabel = "Repair Window 7"};
	if (_x == "HitGlass8") then {_tempLabel = "Repair Window 8"};
	if (_x == "HitGlass9") then {_tempLabel = "Repair Window 9"};
	if (_x == "HitGlass10") then {_tempLabel = "Repair Window 10"};
	if (_x == "HitGlass11") then {_tempLabel = "Repair Window 11"};
	if (_x == "HitGlass12") then {_tempLabel = "Repair Window 12"};
	if (_x == "HitGlass13") then {_tempLabel = "Repair Window 13"};
	if (_x == "HitGlass14") then {_tempLabel = "Repair Window 14"};
	if (_x == "HitGlass15") then {_tempLabel = "Repair Window 15"};
	if (_x == "HitGlass16") then {_tempLabel = "Repair Window 16"};
	if (_x == "HitGlass17") then {_tempLabel = "Repair Window 17"};
	if (_x == "HitRGlass") then {_tempLabel = "Repair Window Right"};
	if (_x == "HitLGlass") then {_tempLabel = "Repair Window Left"};
	if !(_tempLabel == "error") then
		{
			_tempStatement = [];
			_action = "repairGlass";
			_item = _x;
			_tempStatement pushback _action;
			_tempStatement pushback _item;
			_temp2 = format ["%1 Call salvage_setup", _tempStatement];
			_tempExpression = [];
			_tempExpression pushback _tempLabel;
			_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
			_tempSubMenuWindows pushback _tempExpression;
		};
}forEach _glassRepairList;

//Engine Menu
_engineReplaceList = [];
_engineRepairList = [];
_engineSalvageList = [];

{
	if(_x == "hitEngine") then
	{
		_damage = _vehicle getHitPointDamage _x;
		if (_damage == 1) then 
		{
			_engineReplaceList pushback _x;
		} else
		{
			if (_damage > .49 && _damage < 1) then
			{
				_engineRepairList pushback _x;
			} else 
			{
				_engineSalvageList pushback _x;
			};
		};
	};
}forEach _hitpointNames;

//engine Replace

{
	_tempLabel = _x;
	if (_x == "HitEngine") then {_tempLabel = "Replace Engine"};

	if !(_tempLabel == "error") then
		{
			_tempStatement = [];
			_action = "replaceEngine";
			_item = _x;
			_tempStatement pushback _action;
			_tempStatement pushback _item;
			_temp2 = format ["%1 Call salvage_setup", _tempStatement];
			_tempExpression = [];
			_tempExpression pushback _tempLabel;
			_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
			_tempMenu pushback _tempExpression;
		};
}forEach _engineReplaceList;

//engine Repair
{
	_tempLabel = _x;
	if (_x == "HitEngine") then {_tempLabel = "Repair Engine"};
	if !(_tempLabel == "error") then
		{
			_tempStatement = [];
			_action = "repairEngine";
			_item = _x;
			_tempStatement pushback _action;
			_tempStatement pushback _item;
			_temp2 = format ["%1 Call salvage_setup", _tempStatement];
			_tempExpression = [];
			_tempExpression pushback _tempLabel;
			_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
			_tempMenu pushback _tempExpression;
		};
}forEach _engineRepairList;

//engine Salvage
{
	_tempLabel = _x;
	if (_x == "HitEngine") then {_tempLabel = "Salvage Engine"};
	if !(_tempLabel == "error") then
		{
			_tempStatement = [];
			_action = "salvageEngine";
			_item = _x;
			_tempStatement pushback _action;
			_tempStatement pushback _item;
			_temp2 = format ["%1 Call salvage_setup", _tempStatement];
			_tempExpression = [];
			_tempExpression pushback _tempLabel;
			_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
			_tempMenu pushback _tempExpression;
		};
}foreach _engineSalvageList;

//Fuel Tank Menu
_fuelReplaceList = [];
_fuelRepairList = [];
_fuelSalvageList = [];

{
	if(_x == "hitFuel") then
	{
		_damage = _vehicle getHitPointDamage _x;
		if (_damage == 1) then 
		{
			_fuelReplaceList pushback _x;
		} else
		{
			if (_damage > 0 && _damage < 1) then
			{
				_fuelRepairList pushback _x;
			} else 
			{
				_fuelSalvageList pushback _x;
			};
		};
	};
}forEach _hitpointNames;

//fueltank Replace

{
	_tempLabel = _x;
	if (_x == "HitFuel") then {_tempLabel = "Replace Fuel Tank"};

	if !(_tempLabel == "error") then
		{
			_tempStatement = [];
			_action = "replaceFuel";
			_item = _x;
			_tempStatement pushback _action;
			_tempStatement pushback _item;
			_temp2 = format ["%1 Call salvage_setup", _tempStatement];
			_tempExpression = [];
			_tempExpression pushback _tempLabel;
			_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
			_tempMenu pushback _tempExpression;
		};
}forEach _fuelReplaceList;

//Fuel Tank Repair
{
	_tempLabel = _x;
	if (_x == "HitFuel") then {_tempLabel = "Repair Fuel Tank"};
	if !(_tempLabel == "error") then
		{
			_tempStatement = [];
			_action = "repairFuel";
			_item = _x;
			_tempStatement pushback _action;
			_tempStatement pushback _item;
			_temp2 = format ["%1 Call salvage_setup", _tempStatement];
			_tempExpression = [];
			_tempExpression pushback _tempLabel;
			_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
			_tempMenu pushback _tempExpression;
		};
}forEach _fuelRepairList;

//Fuel Tank Salvage
{
	_tempLabel = _x;
	if (_x == "HitFuel") then {_tempLabel = "Salvage Fuel Tank"};
	if !(_tempLabel == "error") then
		{
			_tempStatement = [];
			_action = "salvageFuel";
			_item = _x;
			_tempStatement pushback _action;
			_tempStatement pushback _item;
			_temp2 = format ["%1 Call salvage_setup", _tempStatement];
			_tempExpression = [];
			_tempExpression pushback _tempLabel;
			_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
			_tempMenu pushback _tempExpression;
		};
}foreach _fuelSalvageList;


//other Repair
_overallDamage = 0;
{
	_glass = ["glass", _x] call bis_fnc_instring;
	_rotor = ["rotor", _x] call bis_fnc_instring;
	_wheel = ["wheel", _x] call bis_fnc_instring;
	_engine = ["engine", _x] call bis_fnc_instring;
	_fuel = ["fuel", _x] call bis_fnc_instring;
	
	if !(_glass || _rotor || _wheel || _fuel || _engine) then
	{
	_damage = _vehicle getHitPointDamage _x;
	_overallDamage = _overallDamage + _damage;
	};
} forEach _hitpointNames;

if (_overallDamage > 0) then
{
	_tempLabel = "Repair All Other Damaged Items";
	_tempStatement = [];
	_action = "repairOther";
	_item = "";
	_tempStatement pushback _action;
	_tempStatement pushback _item;
	_temp2 = format ["%1 Call salvage_setup", _tempStatement];
	_tempExpression = [];
	_tempExpression pushback _tempLabel;
	_tempExpression = _tempExpression + [[0],"",-5, [["expression", _temp2]] ,"1","1"];
	_tempMenu pushback _tempExpression;
};

_backButton = ["Back",[0],"",-4,[["expression", "Back ""Mainmenu"" "]],"1","1"];
_tempSubMenuWheels pushback _backButton;
_tempSubMenuWindows pushback _backButton;

_wheelMenuOption = ["Wheel Options",[0],"#USER:ASL_Show_Repair_Options_SubMenuWheels_Array",-5,[["expression", "Wheels ""Submenu"" "]],"1","1"];
_windowMenuOption = ["Window Options",[0],"#USER:ASL_Show_Repair_Options_SubMenuWindows_Array",-5,[["expression", "Windows ""Submenu"" "]],"1","1"];
_tempMenu pushback _wheelMenuOption;
_tempMenu pushback _windowMenuOption;

//Create the Menu
if (count _tempMenu < 2) exitwith {hint str("nothing to repair")};
	
ASL_Show_Repair_Options_SubMenuWheels_Array = _tempSubMenuWheels;
ASL_Show_Repair_Options_SubMenuWindows_Array = _tempSubMenuWindows;
ASL_Show_Repair_Options_Menu_Array = _tempMenu;

showCommandingMenu "";
showCommandingMenu "#USER:ASL_Show_Repair_Options_Menu_Array";

salvage_setup = {
_vehicle = cursorTarget;
_action = _this select 0;
_items = _this select 1;
[_action,_vehicle, _items] execVM 'Custom\advancedRepair\Bones_fnc_salvageAndRepair.sqf';
};
