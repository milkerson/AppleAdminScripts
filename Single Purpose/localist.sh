#!/bin/bash

# 'regionalise' as British
/usr/libexec/PlistBuddy -c "Add AppleEnabledInputSources array"	/Library/Preferences/com.apple.HIToolbox.plist
/usr/libexec/PlistBuddy -c "Add AppleEnabledInputSources:0 dict" /Library/Preferences/com.apple.HIToolbox.plist
/usr/libexec/PlistBuddy -c "Add AppleEnabledInputSources:0:\"KeyboardLayout ID\" integer 2" /Library/Preferences/com.apple.HIToolbox.plist
/usr/libexec/PlistBuddy -c "Add AppleEnabledInputSources:0:\"KeyboardLayout Name\" string British" /Library/Preferences/com.apple.HIToolbox.plist

/usr/libexec/PlistBuddy -c "Add AppleSelectedInputSources array" /Library/Preferences/com.apple.HIToolbox.plist
/usr/libexec/PlistBuddy -c "Add AppleSelectedInputSources:0 dict" /Library/Preferences/com.apple.HIToolbox.plist
/usr/libexec/PlistBuddy -c "Add AppleSelectedInputSources:0:\"KeyboardLayout ID\" integer 2" /Library/Preferences/com.apple.HIToolbox.plist
/usr/libexec/PlistBuddy -c "Add AppleSelectedInputSources:0:\"KeyboardLayout Name\" string British" /Library/Preferences/com.apple.HIToolbox.plist

/usr/libexec/PlistBuddy -c "Add AppleDateResID:smRoman array" /Library/Preferences/com.apple.HIToolbox.plist 
/usr/libexec/PlistBuddy -c "Add AppleDateResID:smRoman:0 integer 2" /Library/Preferences/com.apple.HIToolbox.plist 
/usr/libexec/PlistBuddy -c "Add AppleTimeResID:smRoman array" /Library/Preferences/com.apple.HIToolbox.plist 
/usr/libexec/PlistBuddy -c "Add AppleTimeResID:smRoman:0 integer 2" /Library/Preferences/com.apple.HIToolbox.plist 
/usr/libexec/PlistBuddy -c "Add AppleNumberResID:smRoman array"	/Library/Preferences/com.apple.HIToolbox.plist 
/usr/libexec/PlistBuddy -c "Add AppleNumberResID:smRoman:0 integer 2" /Library/Preferences/com.apple.HIToolbox.plist 

/usr/libexec/PlistBuddy -c "Add AppleLocale string en_GB" /Library/Preferences/.GlobalPreferences.plist 
/usr/libexec/PlistBuddy -c "Add Country string GB" /Library/Preferences/.GlobalPreferences.plist 
/usr/libexec/PlistBuddy -c "Add AppleLanguages:0 string en_GB" /Library/Preferences/.GlobalPreferences.plist

exit 0