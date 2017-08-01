#!/bin/bash

#
# Name of Script: addLDAPtoContactsApp
# Description: This adds the RGM LDAP to the Contacts app in Mavericks.
# Attribution: http://ss64.com/osx/defaults.html
# Created by Mike Wilkerson
# Date created: 09 Apr 2014
# Last modified: 09 Apr 2014
# Revision 0.1
#  

# Sets user template to show all drives and servers on the Desktop
for USER_TEMPLATE in "/System/Library/User Template"/*
do
	defaults write "${USER_TEMPLATE}"/Library/Preferences/com.apple.AddressBook AB3LDAPServers -array-add '{ "ServerType" = 0; "ServerInfo" = { "SSL" = True; "Disabled" = False; "AuthenticationType" = False; "HostName" = "ldap-aus.rgmadvisors.com"; "Scope" = 2; "Title" = "RGM OpenLDAP"; "Base" = "ou=Users,dc=rgmadvisors,dc=com"; "Port" = 636; "UID" = "DECDFC7A-7D17-4D87-90EB-AC975E662AF1"; };}'
done

exit 0