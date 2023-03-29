# Welcome and instructions

if ! command -v zbarimg &> /dev/null
then
    echo "The command zbarimg could not be found, follow these instructions to install it and try again: https://formulae.brew.sh/formula/zbar"
    exit
fi

echo "Welcome to a super basic Branch QR Code generator. Enter in the following fields or press enter to skip. \n"

# Branch Key
read -p "Branch Key: " branch_key
if [ -z "$branch_key" ]; then
    echo "Branch Key must be added. Exiting."
    exit
fi

# Center Logo
read -p "Center Logo URL: " center_logo

# Fallback URL
read -p "Fallback URL: " fallback_url
 
# iOS URL
read -p "iOS URL: " iOS_url
 
# Android URL
read -p "Android URL: " android_url

# QR Code Image File Name
read -p "Enter the file name for the QR Code to be saved in (include file format, ex: .png, .jpg): " output_file
if [ -z "$output_file" ]; then
    output_file="qr-code-$(uuidgen).png"
fi

curl -o $output_file \
--request POST \
--url 'https://api2.branch.io/v2/qr-code' \
--header 'Accept: image/*' \
--header 'Content-Type: application/json' \
--data '{
    "qr_code_settings": {
        "code_pattern": 1,
        "finder_pattern": 1,
        "center_logo_url": "'${center_logo}'",
        "background_image_url": "",
        "code_color": "#000000",
        "background_color": "#FFFFFF",
        "image_format": "png",
        "width": 300,
        "margin": 1,
        "finder_pattern_color": "#000000",
        "finder_eye_color": "#000000"
    },
    "data": {
        "$fallback_url": "'${fallback_url}'",
        "$ios_url": "'${iOS_url}'",
        "$android_url": "'${android_url}'"
    },
    "branch_key": "'${branch_key}'"
}' 

# Print out results and use zbarimg to get url behind qr code
echo "\nFile saved at $PWD/$output_file."
echo "URL for QR Code:"
zbarimg $output_file