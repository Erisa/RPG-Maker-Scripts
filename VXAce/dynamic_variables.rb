if true #Set to false to disable script.
    # (C) Copyright Erisa A. (Seriel, erisa.moe) 2019
    ###############################################################################
    # Erisa ~ Dynamic Variables                                                   #
    #   See under this notice for some help.                                      #
    #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
    # The code here can be reused for any purpose, with credit given.             #
    # This includes both Commercial and Non-Commercial use.                       #
    # However, contact is appreciated before Commercial use.                      #
    # Modified versions must give credit, however it must not be implied that the #
    #  modifications were carried out by me.                                      #
    #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
    # Contact:           |  seriel@erisa.moe                                      #
    #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
    # Created with ♥ by Erisa A. (Seriel, erisa.moe) in 2019                      #
    # Last edited: 2019-01-15 19:16:53 +0000                                      #
    #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
    # This script works by intercepting any call to get a variable and replacing  #
    #   the result with the result of whatever script you have specified below.   #
    # Using this, you can create "Dynamic" variables which change based on        #
    #   different factors, for example a variable which always displays the       #
    #   current map ID, or the health of the first party member.                  #
    # Due to the nature of how this works, trying to set one of these variables   #
    #   to a specific value in-game will NOT WORK. These only support get.        #
    ###############################################################################
    
    # Config is down here somewhere :)
    module Serie_DynVar
      ## START CONFIG
      
      # Make sure to add a comma on the end of the previous line.
      # Basic format:
      # 1 => "script_to_execute", 
      # No comma on the last one!
      VAR_ASSIGNMENTS = {
        500 => "$game_map.map_id",
        501 => "$game_party.members[0].hp"
      }
      
      ## END CONFIG
    end
    
    
    #==============================================================================
    # ** Game_Variables
    #------------------------------------------------------------------------------
    #  This class handles variables. It's a wrapper for the built-in class "Array."
    # The instance of this class is referenced by $game_variables.
    #==============================================================================
    
    class Game_Variables
      alias :eri_getvar :[]
      
      #--------------------------------------------------------------------------
      # * Get Variable
      #--------------------------------------------------------------------------
      def [](variable_id)
        if Serie_DynVar::VAR_ASSIGNMENTS.key?(variable_id)
          eval(Serie_DynVar::VAR_ASSIGNMENTS[variable_id])
        else
          eri_getvar(variable_id)
        end
      end
      
    end
    
    end # if true