#!/bin/sh

defaults write /Library/Preferences/ManagedInstalls ClientIdentifier "stable"
defaults write /Library/Preferences/ManagedInstalls SoftwareRepoURL "http://munki.rgmadvisors.com/repo"
defaults write /Library/Preferences/ManagedInstalls AppleSoftwareUpdatesOnly -bool False

exit 0
