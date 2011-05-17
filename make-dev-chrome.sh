#!/bin/sh

#
# Edit these options
#

CHROME="/Applications/Google Chrome.app"
DEV_CHROME="/Applications/Google Chrome (Dev).app"
DEV_EXECUTABLE="Google Chrome (Dev)"
PROFILE="${HOME}/Library/Application Support/Google/Chrome/Dev"

#
# No need to edit below this line
# 

echo "Removing old"
rm -rf "${DEV_CHROME}"

echo "Copying existing Chrome"
cp -r "${CHROME}" "${DEV_CHROME}"

echo "Renaming executable"
mv "${DEV_CHROME}/Contents/MacOS/Google Chrome" "${DEV_CHROME}/Contents/MacOS/${DEV_EXECUTABLE}"

echo "Creating new executable"
cat >> "${DEV_CHROME}/Contents/MacOS/Google Chrome" << EOF
#!/bin/sh
"${DEV_CHROME}/Contents/MacOS/${DEV_EXECUTABLE}" --user-data-dir="${PROFILE}"
EOF
chmod +x "${DEV_CHROME}/Contents/MacOS/Google Chrome"

echo "Copying icon"
cp app.icns "${DEV_CHROME}/Contents/Resources/app.icns"
