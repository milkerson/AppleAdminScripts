#!/bin/bash

#
# Name of Script: quitPrinterApp
# Description: Automatically quit printer app once the print jobs complete
# Attribution: http://mths.be/osx
# Created by Mike Wilkerson
# Date created: 08 Apr 2014
# Last modified: 08 Apr 2014
# Revision 0.1
#  

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

exit 0