class Frame_Builder
  def add(root)
      @root = root
  end

  def build_frames
    self.build_main
    self.build_status
  end

  def build_main
    frame_main = TkFrame.new(@root) {
      relief 'sunken'
      pack('fill'=>'both', 'expand'=>'1', 'anchor' => 'n')
    }

    label_empty_0 = TkLabel.new(frame_main) do
      grid('row'=>0, 'column'=>0)
    end

    label_url = TkLabel.new(frame_main) do
      text("URL:")
      width(20)
      grid('row'=>1, 'column'=>0)
    end

    label_empty_1 = TkLabel.new(frame_main) do
      grid('row'=>3, 'column'=>0)
    end

    label_network_location = TkLabel.new(frame_main) do
      text("Network Location:")
      grid('row'=>4, 'column'=>0)
    end

    label_database = TkLabel.new(frame_main) do
      text("Database:")
      grid('row'=>5, 'column'=>0)
    end

    label_user = TkLabel.new(frame_main) do
      text("User:")
      grid('row'=>6, 'column'=>0)
    end

    label_port = TkLabel.new(frame_main) do
      text("Port:")
      grid('row'=>7, 'column'=>0)
    end

    label_password = TkLabel.new(frame_main) do
      text("Password:")
      grid('row'=>8, 'column'=>0)
    end

    label_RMDB = TkLabel.new(frame_main) do
      text("Database Engine:")
      grid('row'=>9, 'column'=>0)
    end

    # Entry Field
    entry_url = TkEntry.new(frame_main) do
      width(50)
      borderwidth(1)
      relief "groove"
      grid('row'=>1, 'column'=>1)
    end

    entry_network_location = TkEntry.new(frame_main) do
      width(25)
      borderwidth(1)
      relief "groove"
      grid('row'=>4, 'column'=>1, 'rowspan'=>1, 'columnspan'=>1, 'sticky'=>'w')
    end

    entry_database = TkEntry.new(frame_main) do
      width(25)
      borderwidth(1)
      relief "groove"
      grid('row'=>5, 'column'=>1, 'sticky'=>'w')
    end

    entry_user = TkEntry.new(frame_main) do
      width(25)
      borderwidth(1)
      relief "groove"
      grid('row'=>6, 'column'=>1, 'sticky'=>'w')
    end

    entry_port = TkEntry.new(frame_main) do
      width(25)
      borderwidth(1)
      relief "groove"
      grid('row'=>7, 'column'=>1, 'sticky'=>'w')
    end

    entry_password = TkEntry.new(frame_main) do
      width(25)
      borderwidth(1)
      relief "groove"
      grid('row'=>8, 'column'=>1, 'sticky'=>'w')
    end

    entry_RMDB = TkEntry.new(frame_main) do
      width(25)
      borderwidth(1)
      relief "groove"
      grid('row'=>9, 'column'=>1, 'sticky'=>'w')
    end

    label_empty_2 = TkLabel.new(frame_main) do
      grid('row'=>11, 'column'=>0)
    end

    # Buttons
    button_build = TkButton.new(frame_main) do
      text "Build"
      command { result = command_build(entry_user.get, entry_password.get, entry_network_location.get, entry_port.get, entry_database.get, entry_RMDB.get)
        entry_url.delete(0, :end)
        entry_url.insert(0,result)
      }
      grid('row'=>10, 'column'=>1)
    end

    button_debuild = TkButton.new(frame_main) do
      text "Debuild"
      command { result = command_debuild(entry_url.get)
        entry_network_location.delete(0, :end)
        entry_network_location.insert(0,result[0])

        entry_database.delete(0, :end)
        entry_database.insert(0,result[1])

        entry_user.delete(0, :end)
        entry_user.insert(0,result[2])

        entry_port.delete(0, :end)
        entry_port.insert(0,result[3])

        entry_password.delete(0, :end)
        entry_password.insert(0,result[4])

        entry_RMDB.delete(0, :end)
        entry_RMDB.insert(0,result[5])
      }
      grid('row'=>2, 'column'=>1)
    end
  end

  def build_status
    frame_status_bar = TkFrame.new(@root) {
      background $GUN_METAL
      relief 'sunken'
      borderwidth 2
      highlightbackground "black"
      pack('fill'=>'x', 'anchor' => 's')
    }

    label_version = TkLabel.new(frame_status_bar) do
      background $GUN_METAL
      foreground $WHITE
      text "Version: #{$software_version}"
      pack("side"=>"left")
    end

    label_company = TkLabel.new(frame_status_bar) do
      background $GUN_METAL
      foreground $WHITE
      text "#{$company}"
      pack("side"=>"right")
    end
  end
end
