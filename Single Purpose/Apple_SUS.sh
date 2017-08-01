#!/bin/sh

defaults delete /Library/Preferences/com.apple.SoftwareUpdate CatalogURL

exit 0


# You can verify your change using the following command:
# defaults read /Library/Preferences/com.apple.SoftwareUpdate CatalogURL
# To point the unmanaged client computer back to the Apple Software Update server, use the following command:
# sudo defaults delete /Library/Preferences/com.apple.SoftwareUpdate CatalogURL