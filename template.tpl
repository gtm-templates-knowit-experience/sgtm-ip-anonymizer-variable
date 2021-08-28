___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "IP Anonymizer",
  "description": "Anonymize any IPv4 or IPv6 address by removing the last octet or hex.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "input_ip",
    "displayName": "Client IP Address",
    "simpleValueType": true,
    "valueHint": "127.0.0.1"
  }
]


___SANDBOXED_JS_FOR_SERVER___

const input_ip = data.input_ip;

// Check for valid IPv4
const ipv4_regex = "^(?:25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]\\d|\\d)(?:\\.(?:25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]\\d|\\d)){3}$";

if(input_ip.match(ipv4_regex) !== null){
   return input_ip.substring(0,input_ip.lastIndexOf('.')).concat('.0');
}

//Check for valid IPv6
if(input_ip.match(":") !== null){
 return input_ip.substring(0,input_ip.lastIndexOf(':')).concat('::');
}

return false;


___TESTS___

scenarios: []


___NOTES___

Created on 28.8.2021, 18:46:41


