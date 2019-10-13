if true #Set to false to disable script.
    # Copyright Erisa A. (Seriel, erisa.moe) 2018
    ###############################################################################
    # Erisa ~ Transfer Player on Gameover ~ <3                                    #
    #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
    # The code here can be reused for any purpose, with credit given.             #
    # This includes both Commercial and Non-Commercial use.                       #
    # However, contact is appreciated before Commercial use.                      #
    #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
    # Contact email   | seriel@erisa.moe                                          #
    #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
    # Created with ♥ by Erisa A. (Seriel, erisa.moe) (2018)                                     #
    ###############################################################################
    
    # Edit below here ↓ to configure the script.
    module SerieTransferOnGameover
      
      # The ID of the map that the player should be sent to.
      MAP_ID = 3
      
      # The X and Y co-ordinates of the map where the player should be sent.
      # The third argument is direction where: 
      # 2: down, 4: left, 6: right, 8: up
      # Format: [x,y,d]
      MAP_COORDS = [12,15,8] # [x,y,direction]
      
      # Optional, change nil to a Common Event ID to play it on tranfer.
      # This can be used for example to display a message box or change gold values.
      EVENT_ID = nil
      
    end
    
    #==============================================================================
    # ** Scene_Gameover
    #------------------------------------------------------------------------------
    #  This class performs game over screen processing.
    #==============================================================================
    class Scene_Gameover < Scene_Base
      #--------------------------------------------------------------------------
      # * Start Processing
      #--------------------------------------------------------------------------
      def start
        super
        params = SerieTransferOnGameover::MAP_COORDS
        map = SerieTransferOnGameover::MAP_ID
        SceneManager.clear
        $game_party.members.each { |actor| actor.hp = 1; actor.mp = 1}
        SceneManager.goto(Scene_Map)
        $game_player.reserve_transfer(map, params[0], params[1], params[2])
        unless SerieTransferOnGameover::EVENT_ID.nil?
          $game_temp.reserve_common_event(SerieTransferOnGameOver::EVENT_ID)
        end
      end
    
      def update
      end
      def perform_transition
      end
      undef play_gameover_music
      undef fadeout_speed
      undef fadein_speed
      undef goto_title
      def dispose_background
      end
    end
    
    
    end # of the script