/*
Bones Vehicle Repair Script

Executed from Bones_fnc_salvageAndRepairMenu.sqf

*/

private ["_partsNeeded","_itemsNeeded","_partsToActOn","_partToActOn","_brokenParts","_repairableParts","_salvageableParts","_itemAction","_equippedMagazines","_vehicle","_action","_usedArray","_missingArray","_duration","_progress","_sleepDuration","_startTime","_label", "_chance", "_runOut"];

_partsNeeded = [];
_itemsNeeded = [];
_items = _this select 2;
_partToActOn = [];
_repairableParts =[];
_salvageableParts =[];
_equippedMagazines = magazines player;
_vehicle = _this select 1;
_action = _this select 0;
_usedArray = [];
_missingArray = [];
_partsToActOn = [];
_partsToActOn pushback _items;
_chance = 4; //1 in x chance of Duct tape or fiberglass being consumed if used.

if (ExileClientActionDelayShown) exitWith { false };
ExileClientActionDelayShown = true;
ExileClientActionDelayAbort = false;

//Check if repairable
if (!local _vehicle) exitwith
{
	["InfoTitleAndText", ["Salvage/Repair Info", "Get in driver seat first"]] call ExileClient_gui_toaster_addTemplateToast;
	ExileClientActionDelayShown = false;
	ExileClientActionDelayAbort = false;
};
if (ExileClientPlayerIsInCombat) exitWith
{
	["ErrorTitleOnly", ["You are in combat!"]] call ExileClient_gui_toaster_addTemplateToast;
	ExileClientActionDelayShown = false;
	ExileClientActionDelayAbort = false;
};
if (vehicle player isEqualTo _vehicle) exitWith 
{
	["ErrorTitleOnly", ["Are you serious?"]] call ExileClient_gui_toaster_addTemplateToast;
	ExileClientActionDelayShown = false;
	ExileClientActionDelayAbort = false;
};
if (ExilePlayerInSafezone) exitWith 
{
	["ErrorTitleOnly", ["Leave Safezone First!"]] call ExileClient_gui_toaster_addTemplateToast;
	ExileClientActionDelayShown = false;
	ExileClientActionDelayAbort = false;
};

//Get the attributes for the type of repair
if (_action == 'replaceCarWheel') then
{
	_partsNeeded = 
	[
	["Exile_Item_CarWheel","Car Wheel"]
	];
	_itemsNeeded = 
	[
	["Exile_Item_Wrench","Wrench"]
	];
	_itemAction = 0;
	_duration = 10;
};

if (_action == 'repairCarWheel') then
{
	_partsNeeded = 
	[
	["Exile_Item_DuctTape","Duct Tape"]
	];
	_itemsNeeded = 
	[];
	_itemAction = 0;
	_duration = 10;
};

if (_action == 'salvageCarWheel') then
{
	_partsNeeded = 
	[
	["Exile_Item_CarWheel","Car Wheel"]
	];
	_itemsNeeded = 
	[
	["Exile_Item_Wrench","Wrench"]
	];
	_itemAction = 1;
	_duration = 10;
};

if (_action == 'repairRotor') then
{
	_partsNeeded = 
	[
	["Exile_Item_DuctTape","Duct Tape"]
	];
	_itemsNeeded = 
	[];
	_itemAction = 0;
	_duration = 20;
};

if (_action == 'Replace Main Rotor') then
{
	_partsNeeded = 
	[
	["DDR_Item_Main_Rotor","Main Rotor"]
	];
	_itemsNeeded = 
	[
	["Exile_Item_Wrench","Wrench"]
	];
	_itemAction = 0;
	_duration = 20;
};

if (_action == 'Salvage Main Rotor') then
{
	_partsNeeded = 
	[
	["DDR_Item_Main_Rotor","Main Rotor"]
	];
	_itemsNeeded = 
	[
	["Exile_Item_Wrench","Wrench"]
	];
	_itemAction = 1;
	_duration = 20;
};

if (_action == 'Replace Tail Rotor') then
{
	_partsNeeded = 
	[
	["DDR_Item_Tailrotor","Tail Rotor"]
	];
	_itemsNeeded = 
	[
	["Exile_Item_Wrench","Wrench"]
	];
	_itemAction = 0;
	_duration = 10;
};

if (_action == 'Salvage Tail Rotor') then
{
	_partsNeeded = 
	[
	["DDR_Item_Tailrotor","Tail Rotor"]
	];
	_itemsNeeded = 
	[
	["Exile_Item_Wrench","Wrench"]
	];
	_itemAction = 1;
	_duration = 10;
};

if (_action == 'repairGlass') then
{
	_partsNeeded = 
	[
	["DDR_Item_Fiberglass","Fiberglass"]
	];
	_itemsNeeded = 
	[];
	_itemAction = 0;
	_duration = 10;
};

if (_action == 'replaceGlass') then
{
	_partsNeeded = 
	[
	["DDR_Item_Glass","Windshield Glass"]
	];
	_itemsNeeded = 
	[
	["Exile_Item_Screwdriver","ScrewDriver"]
	];
	_itemAction = 0;
	_duration = 10;
};

if (_action == 'replaceEngine') then
{
	_partsNeeded = 
	[
	["DDR_Item_Engine","Engine"]
	];
	_itemsNeeded = 
	[
	["Exile_Item_Screwdriver","ScrewDriver"],
	["Exile_Item_Pliers", "Pliers"],
	["Exile_Item_Wrench","Wrench"]
	];
	_additionalParts = ["hitEngine1","hitEngine2","hitEngine3","hitEngine4"];
	{
	_partsToActOn pushback _x;
	}forEach _additionalParts;
	_itemAction = 0;
	_duration = 20;
};

if (_action == 'repairEngine') then
{
	_partsNeeded = 
	[
	["Exile_Item_DuctTape","Duct Tape"]
	];
	_itemsNeeded = 
	[];
	_additionalParts = ["hitEngine1","hitEngine2","hitEngine3","hitEngine4"];
	{
	_partsToActOn pushback _x;
	}forEach _additionalParts;
	_itemAction = 0;
	_duration = 10;
};

if (_action == 'salvageEngine') then
{
	_partsNeeded = 
	[
	["DDR_Item_Engine","Engine"]
	];
	_itemsNeeded = 
	[
	["Exile_Item_Screwdriver","ScrewDriver"],
	["Exile_Item_Pliers", "Pliers"],
	["Exile_Item_Wrench","Wrench"]
	];
	_additionalParts = ["hitEngine1","hitEngine2","hitEngine3","hitEngine4"];
	{
	_partsToActOn pushback _x;
	}forEach _additionalParts;
	_itemAction = 1;
	_duration = 20;
};

if (_action == 'replaceFuel') then
{
	_partsNeeded = 
	[
	["DDR_Item_Fuel_Tank","Fuel Tank"]
	];
	_itemsNeeded = 
	[
	["Exile_Item_Wrench","Wrench"]
	];
	_itemAction = 0;
	_duration = 10;
};

if (_action == 'repairFuel') then
{
	_partsNeeded = 
	[
	["Exile_Item_DuctTape","Duct Tape"]
	];
	_itemsNeeded = 
	[];
	_itemAction = 0;
	_duration = 10;
};

if (_action == 'salvageFuel') then
{
	_partsNeeded = 
	[
	["DDR_Item_Fuel_Tank","Fuel Tank"]
	];
	_itemsNeeded = 
	[
	["Exile_Item_Wrench","Wrench"]
	];
	_itemAction = 1;
	_duration = 10;
};

if (_action == 'repairOther') then
{
	_partsNeeded = 
	[
	["Exile_Item_DuctTape","Duct Tape"]
	];
	_itemsNeeded = 
	[];
	_itemAction = 0;
	_duration = 10;
	_partsToActOn = [];
	_allHitpoints = getAllHitPointsDamage _vehicle;
	_hitpointNames = _allHitpoints select 0;
	{
	_glass = ["glass", _x] call bis_fnc_instring;
	_rotor = ["rotor", _x] call bis_fnc_instring;
	_wheel = ["wheel", _x] call bis_fnc_instring;
	_engine = ["engine", _x] call bis_fnc_instring;
	_fuel = ["fuel", _x] call bis_fnc_instring;
	
	if !(_glass || _rotor || _wheel || _fuel || _engine) then
	{
		_partsToActOn pushback _x;
	};
	_noWheels = getnumber (configfile >> "cfgvehicles" >> (typeof _vehicle) >> "numberPhysicalWheels");
	if (_noWheels == 4) then 
		{
			if (_x == "HitRMWheel") then {_partsToActOn pushback _x;};
			if (_x == "HitLMWheel") then {_partsToActOn pushback _x;};
			if (_x == "HitLBWheel") then {_partsToActOn pushback _x;};
			if (_x == "HitRBWheel") then {_partsToActOn pushback _x;};
		};

	if (_noWheels == 6) then 
		{
			if (_x == "HitLBWheel") then {_partsToActOn pushback _x;};
			if (_x == "HitRBWheel") then {_partsToActOn pushback _x;};
		};
	} forEach _hitpointNames
};

//Check for all required tools and parts

if (_itemAction == 0) then
{
	{
	_currentItem = _x select 0;
	if (_currentItem in _equippedMagazines) then
		{	
			_usedArray pushback (_x select 1);
		}
		else
		{
			_missingArray pushback (_x select 1);
		};
	}forEach _partsNeeded;
};

{
_currentItem = _x select 0;
	if (_currentItem in _equippedMagazines) then
		{	
			_usedArray pushback (_x select 1);
		}
		else
		{
			_missingArray pushback (_x select 1);
		};
}forEach _itemsNeeded;

//Check if there is anything to salvage/repair	

_temp1 = count _missingArray;
if !(_temp1 == 0) exitwith
	{
	["ErrorTitleAndText", ["Missing Items!", format ["You are missing the following items : %1, %2, %3, %4. Aborted!",(_missingArray select 0), (_missingArray select 1),(_missingArray select 2),(_missingArray select 3)]]] call ExileClient_gui_toaster_addTemplateToast;
	ExileClientActionDelayShown = false;
	ExileClientActionDelayAbort = false;
	};

//Repair-Salvage the parts listed	

_animation = "Exile_Acts_RepairVehicle01_Animation01";
disableSerialization;
("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutRsc ["RscExileActionProgress", "PLAIN", 1, false];

_keyDownHandle = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call ExileClient_action_event_onKeyDown"];
_mouseButtonDownHandle = (findDisplay 46) displayAddEventHandler ["MouseButtonDown","_this call ExileClient_action_event_onMouseButtonDown"];

player switchMove _animation;
["switchMoveRequest", [netId player, _animation]] call ExileClient_system_network_send;

_startTime = diag_tickTime;
_sleepDuration = _duration / 100;
_progress = 0;

_display = uiNamespace getVariable "RscExileActionProgress";   
_label = _display displayCtrl 4002;
_label ctrlSetText "0%";
_progressBarBackground = _display displayCtrl 4001;  
_progressBarMaxSize = ctrlPosition _progressBarBackground;
_progressBar = _display displayCtrl 4000;  
_progressBar ctrlSetPosition [_progressBarMaxSize select 0, _progressBarMaxSize select 1, 0, _progressBarMaxSize select 3];
_progressBar ctrlSetBackgroundColor [0, 0.78, 0.93, 1];
_progressBar ctrlCommit 0;
_progressBar ctrlSetPosition _progressBarMaxSize; 
_progressBar ctrlCommit _duration;

try
{
	while {_progress < 1} do
	{	
		if (ExileClientActionDelayAbort) then 
		{
			throw 1;
		};

		uiSleep _sleepDuration; 
		_progress = ((diag_tickTime - _startTime) / _duration) min 1;
		_label ctrlSetText format["%1%2", round (_progress * 100), "%"];
	};
	throw 0;
}
catch
{
	_progressBarColor = [];
	switch (_exception) do 
	{
		case 0:
		{
			_progressBarColor = [0.7, 0.93, 0, 1];
			{
			_vehicle setHitPointDamage [_x,_itemAction];
			}forEach _partsToActOn;
			if (_itemAction == 0) then
			{
				{
				_tempItem = _x select 0;
				if !(_tempItem == "Exile_Item_DuctTape" || _tempItem == "DDR_Item_Fiberglass") then
					{
					player removeItem _tempItem;
					}else
					{
					_runOut = floor random _chance;
					if (_runOut == 0) then
						{
							player removeItem _tempItem;
							if (_tempItem == "Exile_Item_DuctTape") then
							{
							["ErrorTitleOnly", ["Your Duct Tape has run out!"]] call ExileClient_gui_toaster_addTemplateToast;
							}else
							{
							["ErrorTitleOnly", ["You have run out of fiberglass sheets!"]] call ExileClient_gui_toaster_addTemplateToast;
							};
						};
					};
				}forEach _partsNeeded;
			} 
			else
			{
				{
				_tempPart = _x select 0;
				_itemCount = {_x == _tempPart} count (Magazines player);
				player addItem _tempPart select 0;
				_tempcount = {_x == _tempPart} count (Magazines player);
				if(_itemCount == _tempcount) then
				{
					_holder = createVehicle ["GroundWeaponHolder", position player, [], 0, "CAN_COLLIDE"];
					_holder addItemCargoGlobal [_tempPart, 1];
					["InfoTitleAndText",["Repair/Salvage Info", format["You have no space, %1 placed on the ground!",_x select 1]]] call ExileClient_gui_toaster_addTemplateToast;
				};
				}forEach _partsNeeded;
			};
			["InfoTitleAndText",["Repair/Salvage Info", "You have completed the action!"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		case 1: 	
		{ 
			["InfoTitleAndText",["Repair/Salvage Info", "Do not move while repairing or salvaging!"]] call ExileClient_gui_toaster_addTemplateToast;
			_progressBarColor = [0.82, 0.82, 0.82, 1];
		};
	};	
	player switchMove "";
	["switchMoveRequest", [netId player, ""]] call ExileClient_system_network_send;
	_progressBar ctrlSetBackgroundColor _progressBarColor;
	_progressBar ctrlSetPosition _progressBarMaxSize;
	_progressBar ctrlCommit 0;
};

("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutFadeOut 2; 
(findDisplay 46) displayRemoveEventHandler ["KeyDown", _keyDownHandle];
(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _mouseButtonDownHandle];
ExileClientActionDelayShown = false;
ExileClientActionDelayAbort = false;