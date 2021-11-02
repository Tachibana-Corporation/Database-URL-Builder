# Designed by Nathanial Tachibana for use by the Tachibana Corporation
# Designed on 08/12/2019

# Variables
$company = "Tachibana Corporation(™)"
$company_link = "https://www.tachibana.tech/"
$program_information = "Trying to remember how to build a connection string was a pain, " +
                      "so we built this program.\n\nDesigned by #{$company}\n#{$company_link}"
$license = "This code is free to use, and is licensed by the Tachibana Corporation Software License.\n" + "Code was designed by #{$company}.\n"
$software_version = "1.0.0"
$application_name = "Database String Builder"
$root_directory = "../.."

# Required ruby code
require "#{$root_directory}/lib/colors.rb"
require "../view/application_builder.rb"

# Start Main application
$program = Application_Builder.new
$program.start
