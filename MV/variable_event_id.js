//=============================================================================
// variable_evnt_id.js
//=============================================================================

/*:
* @plugindesc 
* @author Erisa (Seriel)
* 
* @plugindesc Makes a variable contain the ID of the event being executed. Common Events will return the Event that last ran.
*
* @help 
* --------------------------------------------------------------------------------
* Free for commercial and non commercial use.
* Version 1.0
* --------------------------------------------------------------------------------
*
* --------------------------------------------------------------------------------
* Version History
* --------------------------------------------------------------------------------
* 1.0 - Release
*
* @param Variable ID
* @desc The variable where the event ID is stored.
* @default 1
*/

(function() {
	var parameters = PluginManager.parameters('JK_EventVariable');
	var SEeventvariableid = Number(parameters['Variable ID']) || 1;
	
	var _SerielGame_Interpreter_prototype_setup = Game_Interpreter.prototype.setup;
	Game_Interpreter.prototype.setup = function(list, eventId) {
		_SerielGame_Interpreter_prototype_setup.call(this, list, eventId);
		var oldValue = $gameVariables.value(SEeventvariableid);
		$gameVariables.setValue(SEeventvariableid, oldValue = eventId);
	};
})();
