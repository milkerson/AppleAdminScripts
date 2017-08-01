#!/bin/bash

defaults write /Library/Preferences/com.apple.SoftwareUpdate CatalogURL https://margarita.rgmadvisors.com/content/catalogs/others/index-10.9-mountainlion-lion-snowleopard-leopard.merged-1_update-testers.sucatalog

exit 0

# You can verify your change using the following command:
# defaults read /Library/Preferences/com.apple.SoftwareUpdate CatalogURL
# To point the unmanaged client computer back to the Apple Software Update server, use the following command:
# sudo defaults delete /Library/Preferences/com.apple.SoftwareUpdate CatalogURL
