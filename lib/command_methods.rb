def program_information_method
  Tk::messageBox :type => 'ok', :message => $program_information, :icon => 'info', :title => 'Program Information'
end

def program_license_method
  Tk::messageBox :type => 'ok', :message => $license, :icon => 'info', :title => 'Program License'
end

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
