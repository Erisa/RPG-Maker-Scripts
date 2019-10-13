# RPG Maker Scripts/Plugins
This repository contains a collection of scripts and plugins for the RPG Maker engines that I have created over the past years, collected in one place for easy browsing and use.

## VX Ace

To install a VX Ace script: select the "Raw" button on the script page, open your projects script editor, copy all the text and paste it in a new script slot above "Insert here" by right clicking that entry and selecting "Insert".

### DT's Autosave (Cleaned up & Switch disable)
This script is a script [originally created by DoctorTodd](https://forums.rpgmakerweb.com/index.php?threads/autosave.2707/) with modifications by myself that clean up the code and add the ability to disable the autosave with the use of a switch. All credits belong to the original author.

-> [Download Script](https://github.com/Erisa/RPG-Maker-Scripts/blob/master/VXAce/dt_autosave_cleaned.rb)

### Dynamic Variables
This script works by intercepting any call to get a variable and replacing the result with the result of whatever script you have specified in the configuration.  
Using this, you can create "Dynamic" variables which change based on different factors, for example a variable which always displays the current map ID, or the health of the first party member.  
Due to the nature of how this works, trying to set one of these variables to a specific value in-game will NOT WORK. These only support get.

-> [Download Script](https://github.com/Erisa/RPG-Maker-Scripts/blob/master/VXAce/dynamic_variables.rb)

### Switch/Variable Logger
This simple script will send debug output to the games console whenever a switch or variable is changed, allowed you to track the flow of gameplay while playtesting.

-> [Download Script](https://github.com/Erisa/RPG-Maker-Scripts/blob/master/VXAce/switch_variable_logger.rb)

### Transfer Player on Gameover
This code works by intercepting the Game Over flow of the game and instead tranfering the player to a specific map. This can be used to create your own custom Game Over event, before returning the player to the title screen or simply starting the game anew -- whatever you prefer!  
To stop the game from triggering the Game Over flow repeatedly, all of the actor HP is set to 1.

-> [Download Script](https://github.com/Erisa/RPG-Maker-Scripts/blob/master/VXAce/transfer_player_on_gameover.rb)

## MV

To install an MV plugin: select "Raw" on the scripts page, go to save the page from the right click menu or Ctrl+S and then save the file into the `js/plugins` folder of your project.

### Event on Load
This plugin lets you run events when loading save files.  
This is done by specificying whether you want an event to load when loading a file, on a New Gamer or on both and then specifying the Common Event ID to be used.

-> [Download Script](https://github.com/Erisa/RPG-Maker-Scripts/blob/master/MV/event_on_load.js)

### Max File Size
Simple plugin that allows you to change the max amount of file slots in your game.

-> [Download Script](https://github.com/Erisa/RPG-Maker-Scripts/blob/master/MV/max_file_size.js)


### Variable Event ID
Simple plugin that makes a specified variable contain the map ID that the player is currently on. Used for referring to the ID in events without unnecessary script calls.

-> [Download Script](https://github.com/Erisa/RPG-Maker-Scripts/blob/master/MV/variable_event_id.js)
