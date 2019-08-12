# Designed by Tyrel Tachibana for use by the Tachibana Software Company
# Desgined on 08/12/2019

# Documentation - https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING
# String Example - postgresql://[user[:password]@][netloc][:port][,...][/dbname][?param1=value1&...]
# postgresql://
# postgresql://localhost
# postgresql://localhost:5433
# postgresql://localhost/mydb
# postgresql://user@localhost
# postgresql://user:secret@localhost
# postgresql://other@localhost/otherdb?connect_timeout=10&application_name=myapp
# postgresql://host1:123,host2:456/somedb?target_session_attrs=any&application_name=myapp

require 'tk'

root = TkRoot.new
root.title = "Database String Builder"
root.minsize(400,200)

frame_main = TkFrame.new(root) {
  relief 'sunken'
  borderwidth 2
  padx 2
  pady 2
  pack('fill' => 'both')
}

# Varaibles
company = "Tachibana Software Company"
company_link = "https://www.tachibanasoftware.com/"
program_information = "Trying to remember how to build a connection string was a pain, " +
                      "so I built this program.\n\nDesigned by Tachibana Software Company(™)\n#{company_link}"
license = "This code is free to use and edit by non-commercial users.\n" +
          "Any upgrades or edits provided outside of the organization are still wholley owned by #{company} and subject to this license.\n"

# Labels
label_url = TkLabel.new(frame_main) do
  text("URL:")
  width(15)
  grid('row'=>0, 'column'=>0)
end

label_network_location = TkLabel.new(frame_main) do
  text("Network Location:")
  width(15)
  grid('row'=>2, 'column'=>0)
end

label_database = TkLabel.new(frame_main) do
  text("Database:")
  width(15)
  grid('row'=>3, 'column'=>0)
end

label_user = TkLabel.new(frame_main) do
  text("User:")
  width(15)
  grid('row'=>4, 'column'=>0)
end

label_port = TkLabel.new(frame_main) do
  text("Port:")
  width(15)
  grid('row'=>5, 'column'=>0)
end

label_password = TkLabel.new(frame_main) do
  text("Password:")
  width(15)
  grid('row'=>6, 'column'=>0)
end

label_RMDB = TkLabel.new(frame_main) do
  text("Database Engine:")
  width(15)
  grid('row'=>7, 'column'=>0)
end

# Entry Field
entry_url = TkEntry.new(frame_main) do
  width(75)
  borderwidth(1)
  relief "groove"
  grid('row'=>0, 'column'=>1, 'columnspan'=>2)
end
entry_network_location = TkEntry.new(frame_main) do
  width(25)
  borderwidth(1)
  relief "groove"
  grid('row'=>2, 'column'=>1)
end
entry_database = TkEntry.new(frame_main) do
  width(25)
  borderwidth(1)
  relief "groove"
  grid('row'=>3, 'column'=>1)
end
entry_user = TkEntry.new(frame_main) do
  width(25)
  borderwidth(1)
  relief "groove"
  grid('row'=>4, 'column'=>1)
end
entry_port = TkEntry.new(frame_main) do
  width(25)
  borderwidth(1)
  relief "groove"
  grid('row'=>5, 'column'=>1)
end
entry_password = TkEntry.new(frame_main) do
  width(25)
  borderwidth(1)
  relief "groove"
  grid('row'=>6, 'column'=>1)
end
entry_RMDB = TkEntry.new(frame_main) do
  width(25)
  borderwidth(1)
  relief "groove"
  grid('row'=>7, 'column'=>1)
end

# Buttons
button_build = TkButton.new(frame_main) do
  text "Build"
  command { result = command_build(entry_user.get, entry_password.get, entry_network_location.get, entry_port.get, entry_database.get, entry_RMDB.get)
    entry_url.delete(0, :end)
    entry_url.insert(0,result)
  }
  grid('row'=>8, 'column'=>1)
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
  grid('row'=>1, 'column'=>1)
end
button_info = TkButton.new(frame_main) do
  text "Information"
  command { Tk::messageBox :type => 'ok',
	    :message => program_information,
	    :icon => 'info', :title => 'Program Information'
  }
  grid('row'=>9, 'column'=>0)
end
button_license = TkButton.new(frame_main) do
  text "License"
  command { Tk::messageBox :type => 'ok',
	    :message => license,
	    :icon => 'info', :title => 'Program License'
  }
  grid('row'=>9, 'column'=>3)
end
button_exit = TkButton.new(frame_main) do
  text "EXIT"
  command { exit }
  grid('row'=>9, 'column'=>1)
end

def command_build(user,password,network_location,port,database,rmdb)
  return "#{rmdb}://#{user}:#{password}@#{network_location}:#{port}/#{database}"
end

def command_debuild(url)
  network_location = url.split("@")[1].split(":")[0]
  database = url.split("@")[1].split(":")[1].split("/")[1]
  user = url.split("//")[1].split(":")[0]
  port = url.split("@")[1].split(":")[1].split("/")[0]
  password = url.split(":")[2].split("@")[0]
  rmdb =  url.split("://")[0]
  return ["#{network_location}","#{database}","#{user}","#{port}","#{password}","#{rmdb}"]
end

# Start Main application
Tk.mainloop
