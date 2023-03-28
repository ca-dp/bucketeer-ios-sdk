#!/bin/bash

confirm_api_url () {
    echo "Please input your API_URL. e.g. Please change this to https://api.bucketeer.io"
    read input

    if [ -z $input ]; then
        confirm_api_url
    fi
    API_URL=$input
}

confirm_sdk_key () {
    echo "Please input your SDK_KEY."
    read input

    if [ -z $input ]; then
        confirm_sdk_key
    fi
    SDK_KEY=$input
}

if [ "$CI" = "" ]; then
    confirm_api_url
    confirm_sdk_key
fi


plist=$(cat << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>apiURL</key>
	<string>${API_URL}</string>
	<key>sdkKey</key>
	<string>${SDK_KEY}</string>
</dict>
</plist>
EOF
)

echo "$plist" > ./BucketeerTests/environment.plist
echo "Updated ./BucketeerTests/environment.plist"

echo "$plist" > ./Example/environment.plist
echo "Updated ./Example/environment.plist"

echo "$plist" > ./ExampleTVOS/environment.plist
echo "Updated ./ExampleTVOS/environment.plist"
