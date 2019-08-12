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

def url_builder(user, password, network_location, port, database, rmdb)
  return "#{rmdb}://#{user}:#{password}@#{network_location}:#{port}/#{database}"
end

def url_debuild(url)
  rmdb =  url.split("://")[0]
  network_location = url.split("@")[1].split(":")[0]
  database = url.split("@")[1].split(":")[1].split("/")[1]
  user = url.split("//")[1].split(":")[0]
  port = url.split("@")[1].split(":")[1].split("/")[0]
  password = url.split(":")[2].split("@")[0]
  return {"address"=>"#{network_location}","database"=>"#{database}","username"=>"#{user}","port"=>"#{port}","password"=>"#{password}","engine"=>"#{rmdb}"}
end

while true
  puts "1. String Builder\n2. String Breaker\n3. Exit\n4. Program Information\n5. License Information"
  case gets.chomp.to_i
  when 1
    print "Username: "
    user = gets.chomp
    print "Password: "
    password = gets.chomp
    print "Network Address: "
    network_location = gets.chomp
    print "Network Port: "
    port = gets.chomp
    print "Database: "
    database = gets.chomp
    print "Database Engine: "
    rmdb = gets.chomp
    puts url_builder(user, password, network_location, port, database, rmdb)
  when 2
    print "Database URL: "
    url = gets.chomp
    url_debuild(url).each do |key, value|
      puts "#{key}:#{value}"
    end
  when 3
    break
  when 4
    company_link = "https://www.tachibanasoftware.com/"
    program_information = "Trying to remember how to build a connection string was a pain, " +
                          "so I built this program.\n\nDesigned by Tachibana Software Company(™)\n#{company_link}"
    puts program_information
  when 5
    company = "Tachibana Software Company"
    license = "This code is free to use and edit by non-commercial users.\n" +
              "Any upgrades or edits provided outside of the organization are still wholley owned\nby #{company} and subject to this license.\n"
    puts license
  else
    "Invalid option, please refrence the menu fr your options."
  end
end
