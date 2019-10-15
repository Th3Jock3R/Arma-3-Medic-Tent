params ["_object"];

private _action = [
  "medicTentBuild",
  "Zelt aufbauen",
  "",
  {
    params ["_object"];
    [_object] call TJR_fnc_tentUnpacking;
  },
  {true},
  {},
  [_object]
] call ace_interact_menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

[_object, 0] call ace_cargo_fnc_setSpace;
[_object, 6] call ace_cargo_fnc_setSize;
[_object, true, [0, 2, 0], 0] call ace_dragging_fnc_setCarryable;