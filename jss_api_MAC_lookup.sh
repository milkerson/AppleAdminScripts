#!/bin/bash
#
# Pam Matthews, script to grovel through DHCP logs and find user info for IP numbers.
# September 11, 2013
# Updated 07 Jun 2017 by Mike Wilkerson

if [ "$#" == "0" ]; then
    echo "No arguments provided, please enter IP number "
    exit 1
fi

MY_JSS_BASEURL=https://jss.rgmadvisors.com:8443/
MY_JSS_APIURL="${MY_JSS_BASEURL}JSSResource/"
CURL_OPTIONS="-k -H \"Accept: application/xml\""
MY_API_USER="api_rw"
MY_API_PASS="vcWwm>gdQhpH92mZ"
MY_TMPFILE=/tmp/jss_lookup.log
DHCPSERVER=chasemon2
IP_ADDRESS=$1
echo "DHCP on ${DHCPSERVER} and casper lookup for: "${IP_ADDRESS}

MY_MAC_ADDRESS=`ssh ${DHCPSERVER} grep ${IP_ADDRESS} /var/log/messages | grep DHCPACK | tail -1 | egrep -io '[0-9a-f]{2}:[0-9a-f]{2}:[0-9a-f]{2}:[0-9a-f]{2}:[0-9a-f]{2}:[0-9a-f]{2}' | sed -e 's/:/\./g'`

if [ -z "$MY_MAC_ADDRESS" ]; then
  echo "IP not found on ${DHCPSERVER} $IP_ADDRESS"
else
    MY_MAC_SYSLOG=`ssh ${DHCPSERVER} grep ${IP_ADDRESS} /var/log/messages | grep DHCPACK | tail -1`
    echo ${MY_MAC_SYSLOG}

    #Look up Mac address 1
    #curl ${CURL_OPTIONS} --output "${MY_TMPFILE}" --request GET --user "${MY_API_USER}":"${MY_API_PASS}" \
touch "${MY_TMPFILE}"
    curl ${CURL_OPTIONS} --output "${MY_TMPFILE}" --request GET --user "${MY_API_USER}":"${MY_API_PASS}" \
        "${MY_JSS_APIURL}computers/macaddress/${MY_MAC_ADDRESS}" >"${MY_TMPFILE}"

    if `grep -q  "The server has not found anything matching the request URI" $MY_TMPFILE `; then
        echo "MAC ADDRESS for: ${IP_ADDRESS} not found in JamfPro..."
        exit 0
    else
        if [ -s $MY_TMPFILE  ]; then
            chmod +x ${MY_TMPFILE}
            echo "name: " `xml_grep  --text_only //computer/general/name    ${MY_TMPFILE}`
            echo "ip_address: " `xml_grep  --text_only //computer/general/ip_address  ${MY_TMPFILE}`
            echo "real_name: " `xml_grep  --text_only //computer/location/real_name  ${MY_TMPFILE}`
            echo "mac_address: " `xml_grep  --text_only //computer/general/mac_address  ${MY_TMPFILE}`
            echo "asset_tag: " `xml_grep  --text_only //computer/general/asset_tag  ${MY_TMPFILE}`
            echo "report_date: " `xml_grep  --text_only //computer/general/report_date  ${MY_TMPFILE}`
            echo "initial_entry_date: " `xml_grep  --text_only //computer/general/initial_entry_date  ${MY_TMPFILE}`
            echo "last_contact_time: " `xml_grep  --text_only //computer/general/last_contact_time  ${MY_TMPFILE}`
            echo "username: " `xml_grep  --text_only //computer/location/username  ${MY_TMPFILE}`
            echo "email_address: " `xml_grep  --text_only //computer/location/email_address  ${MY_TMPFILE}`
            echo "position: " `xml_grep  --text_only //computer/location/position  ${MY_TMPFILE}`
        else
            echo "MAC ADDRESS for: $IP_ADDRESS from ${DHCPSERVER} not found in JamfPro... giving up."
        fi

    fi
    rm ${MY_TMPFILE}

fi