#!/usr/bin/python

import os.path
import plistlib
import sys
import xml.parsers.expat as expat
import commands

wasBinary = False
userID = commands.getoutput("/usr/bin/whoami")

expandedPath = os.path.expanduser('~/Library/Preferences/com.apple.AddressBook.plist')
userTemplatePath = os.path.expanduser('/System/Library/User Template/English.lproj/Library/Preferences/com.apple.AddressBook.plist')
try:
	preferences = plistlib.Plist.fromFile(expandedPath)

except (expat.ExpatError):
	wasBinary = True
	os.system("/usr/bin/plutil -convert xml1 %s" % expandedPath)

	try:
		preferences = plistlib.Plist.fromFile(expandedPath)

	except (ImportError):
		os.system("/usr/bin/plutil -convert binary1 %s" % expandedPath )
		print "The plist at '%s' has a date in it, and therefore is not useable.\n" % expandedPath
		sys.exit()

except (ImportError):
	print "The plist at '%s' has a date in it, and therefore is not useable.\n" % expandedPath

except:
	print 'Unexpected error:', sys.exc_info()[0]
	sys.exit()

# Here we should have a useable preferences file

if not(preferences.has_key("AB3LDAPServers")):
	preferences["AB3LDAPServers"] = []

theEntry = None
for server in preferences.AB3LDAPServers:
	if server.ServerInfo.HostName.lower() == "directory.upenn.edu":
		theEntry = server

if not(theEntry):
	# here we need to add a entry
	theEntry = {}
	theEntry["ServerInfo"] = {}
	theEntry["ServerType"] = 0
	preferences["AB3LDAPServers"].append(theEntry)

# Now that we have something to start with, lets set everything
theEntry["ServerInfo"]["AuthenticationType"] = False
theEntry["ServerInfo"]["Base"] = "ou=Users,dc=rgmadvisors,dc=com"
theEntry["ServerInfo"]["Disabled"] = False
theEntry["ServerInfo"]["Enabled"] = True
theEntry["ServerInfo"]["HostName"] = "ldap-aus.rgmadvisors.com"
theEntry["ServerInfo"]["Port"] = 636
theEntry["ServerInfo"]["Scope"] = 2
theEntry["ServerInfo"]["SSL"] = True
theEntry["ServerInfo"]["Title"] = "RGM OpenLDAP"

if not(theEntry["ServerInfo"].has_key("UID")):
	theEntry["ServerInfo"]["UID"] = commands.getoutput("/usr/bin/uuidgen")
	
# Now to write things back to the file
try:
	preferences.write(userTemplatePath)
	# preferences.write("/tmp/com.apple.Addressbook.plist") # test
except:
	print "Unable to write to file: %s" % userTemplatePath
	
# And finally we should leave the plist in the form we found it
if wasBinary:
	os.system("/usr/bin/plutil -convert binary1 %s" % userTemplatePath )