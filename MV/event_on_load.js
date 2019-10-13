//=============================================================================
// event_on_load.js
//=============================================================================


/*:
* @author Erisa (Seriel)
* 
* @plugindesc This plugin runs a common event every time a file is loaded.
*
* @help 
* --------------------------------------------------------------------------------
* Version 1.0
* --------------------------------------------------------------------------------
*
* --------------------------------------------------------------------------------
* Version History
* --------------------------------------------------------------------------------
* 1.0 - Release
*
* @param Run event on load?
* @desc Set to true or false.
* @default false
* 
* @param Load Event ID
* @desc The ID of the common event called when a file is loaded. Only occurs if Load Event ID is true.
* @default 1
* 
* @param Run event on New Game?
* @desc Set to true or false.
* @default false
* 
* @param New Game Event ID
* @desc The ID of the common event called when a file is loaded. Only occurs if Load Event ID is true.
* @default 2
*/

(function() {
	var parameters = PluginManager.parameters('SE_LoadEvent');
	
	var SELoadEvent = Boolean(parameters['Run event on load?']) || false;
	var SELoadID = Number(parameters['Load Event ID']) || 0;
	
	var SENewGame = Boolean(parameters['Run event on New Game?']) || false;
	var SENewGame = Number(parameters['New Game Event ID']) || 0;
	
	var _Seriel_Scene_Load_prototype_onLoadSuccess = Scene_Load.prototype.onLoadSuccess;
	Scene_Load.prototype.onLoadSuccess = function(args) {
		_Seriel_Scene_Load_prototype_onLoadSuccess.call(this, args);
		if (SELoadEvent) {
			$gameTemp.reserveCommonEvent(SELoadID);
		} 
	};
	
	var _Seriel_DataManager_setupNewGame = DataManager.setupNewGame;
	DataManager.setupNewGame = function() {
		_Seriel_DataManager_setupNewGame.call(this);
		if (SENewGame) {
			$gameTemp.reserveCommonEvent(SENewGame);
		} 
	};
	
})();
