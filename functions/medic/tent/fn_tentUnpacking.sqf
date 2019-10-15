params ["_box"];
[
	30,  //seconds to do
	_box,
	{
		params ["_box"];
		private _position = getPos _box;
		private _dir = direction _box;
		deleteVehicle _box;

		private _tent = "MASH_EP1" createVehicle _position;
		_tent setDir _dir - 180;
		_tent setVariable ["ACE_medical_isMedicalFacility", true];

		_action = [
			"medicTentDestroy",
			"Zelt abbauen",
			"",
			{
				[_this select 0] call TJR_fnc_tentPacking;
			},
			{true},
			{},
			[_tent]
		]  call ace_interact_menu_fnc_createAction;

		[_tent, 0, ["ACE_MainActions"], _action] remoteExecCall ["ace_interact_menu_fnc_addActionToObject", 0, true];
	},
	{},
	"Das Zelt wird aufgebaut..."
] call ace_common_fnc_progressBar;
