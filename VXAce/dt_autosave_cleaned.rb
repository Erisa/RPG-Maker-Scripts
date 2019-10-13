#===============================================================================
#
# DT's Autosave
# Author: DoctorTodd
# Date (06/22/2012)
# Version: (1.0.0) (VXA)
# Level: (Simple)
# Email: Todd@beacongames.com
# Cleaned up and switch disable added by: 
#  Erisa A. <seriel@erisa.moe>
#
#===============================================================================
#
# NOTES: 1)This script will only work with ace.
#
#===============================================================================
#
# Description: Saves the game when transferring the map, before battle,
# and opening the menu (all optional).
#
# Credits: Me (DoctorTodd)
#
#===============================================================================
#
# Instructions
# Paste above main.
# Call using Autosave.call
#
#===============================================================================
#
# Free for any use as long as I'm credited.
#
#===============================================================================
#
# Editing begins 40 and ends on 56.
#
#===============================================================================
module ToddAutoSaveAce

    #Max files (without autosave).
    MAXFILES = 16

    #Autosave file name.
    AUTOSAVEFILENAME = "Autosave"

    #Autosave before battle?
    AUTOSAVEBB =  true

    #Autosave when menu opened?
    AUTOSAVEM =  true

    #Autosave when changing map?
    AUTOSAVETM =  true
  
    #ID of switch which must be enabled for autosave to function.
    ENABLEDSWITCH = 1
  
  end
#==============================================================================
# ** Autosave
#------------------------------------------------------------------------------
# This module contains the autosave method. This is allows you to use the
# "Autosave.call" command.
#==============================================================================

module Autosave
#--------------------------------------------------------------------------
# * Call method
#--------------------------------------------------------------------------
def self.call
  DataManager.save_game_without_rescue(0)
end
end
#==============================================================================
# ** DataManager
#------------------------------------------------------------------------------
#  This module manages the database and game objects. Almost all of the
# global variables used by the game are initialized by this module.
#==============================================================================

module DataManager
#--------------------------------------------------------------------------
# * Maximum Number of Save Files
#--------------------------------------------------------------------------
def self.savefile_max
  return ToddAutoSaveAce::MAXFILES + 1
end  
end
#==============================================================================
# ** Scene_Map
#------------------------------------------------------------------------------
#  This class performs the map screen processing.
#==============================================================================

class Scene_Map < Scene_Base
#--------------------------------------------------------------------------
# * Preprocessing for Battle Screen Transition
#--------------------------------------------------------------------------
alias toddsave_pre_battle_scene pre_battle_scene
def pre_battle_scene
  toddsave_pre_battle_scene
  temp = ToddAutoSaveAce::ENABLEDSWITCH
  Autosave.call if (ToddAutoSaveAce::AUTOSAVEBB && $game_switches[temp])
end
#--------------------------------------------------------------------------
# * Call Menu Screen
#--------------------------------------------------------------------------
alias toddsave_call_menu call_menu
def call_menu
  temp = ToddAutoSaveAce::ENABLEDSWITCH
  if (ToddAutoSaveAce::AUTOSAVEM && $game_switches[temp])
    Autosave.call
  end
end
#--------------------------------------------------------------------------
# * Post Processing for Transferring Player
#--------------------------------------------------------------------------
alias toddsave_post_transfer post_transfer
def post_transfer
  toddsave_post_transfer
  temp = ToddAutoSaveAce::ENABLEDSWITCH
  Autosave.call if (ToddAutoSaveAce::AUTOSAVETM && $game_switches[temp])
end
end