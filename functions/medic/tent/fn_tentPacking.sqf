params ["_object"];
[
	30,  //seconds to do
	_object,
	{
		params ["_object"];
		_position = position _object;
		_dir = getDir _object;
		deleteVehicle _object;

		private _box = "Land_PaperBox_closed_F" createVehicle _position;
		_box setDir _dir - 180;

		private _action = [
			"medicTentBuild",
			"Zelt aufbauen",
			"",
			{
				params ["_box"];
				[_box] call TJR_fnc_tentUnpacking;
			},
			{true},
			{},
			[_box]
		] call ace_interact_menu_fnc_createAction;

		[_box, 0, ["ACE_MainActions"], _action] remoteExecCall ["ace_interact_menu_fnc_addActionToObject", 0, true];

		[_box, true, [0, 2, 0], 0] remoteExecCall ["ace_dragging_fnc_setCarryable", 0, true];
		[_box, 6] remoteExecCall ["ace_cargo_fnc_setSize", 0, true];
		[_box, 0] remoteExecCall ["ace_cargo_fnc_setSpace", 0, true];
	},
	{},
	"Das Zelt wird abgebaut..."
] call ace_common_fnc_progressBar;
