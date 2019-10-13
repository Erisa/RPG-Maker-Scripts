if true #Set to false to disable script.
  
    # (C) Copyright Erisa A. (Seriel, erisa.moe) 2019
    ###############################################################################
    # Erisa ~ Switch/Variable Logger                                              #
    #   You must enable Game -> Show Console before use. Only works in test mode  #
    #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
    # The code here can be reused for any purpose, with credit given.             #
    # This includes both Commercial and Non-Commercial use.                       #
    # However, contact is appreciated before Commercial use.                      #
    # Modified versions must give credit, however it must not be implied that the #
    #  modifications were carried out by me.                                      #
    #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
    # Contact:           | seriel@erisa.moe                                       #
    #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
    # Created with ♥ by Erisa A. (Seriel, erisa.moe) in 2019                      #
    # Last edited: 2019-01-14 23:54:46 +0000                                      #
    ###############################################################################
    
    
    #==============================================================================
    # ** Game_Switches
    #------------------------------------------------------------------------------
    #  This class handles switches. It's a wrapper for the built-in class "Array."
    # The instance of this class is referenced by $game_switches.
    #==============================================================================
    
    class Game_Switches
      alias :eri_setbool :[]= 
      
      def []=(switch_id, value)
        puts "[Debug] Switch #{switch_id} changed to #{value}!" if $TEST
        eri_setbool(switch_id, value)
      end
    end
    
    #==============================================================================
    # ** Game_Variables
    #------------------------------------------------------------------------------
    #  This class handles variables. It's a wrapper for the built-in class "Array."
    # The instance of this class is referenced by $game_variables.
    #==============================================================================
    
    class Game_Variables
      
      alias :eri_setvar :[]=  
      #--------------------------------------------------------------------------
      # * Set Variable
      #--------------------------------------------------------------------------
      def []=(variable_id, value)
        puts "[Debug] Variable #{variable_id} changed to '#{value}'!" if $TEST
        eri_setvar(variable_id, value)
      end
    end
    
    end # if true