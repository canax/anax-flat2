#!/usr/bin/env bash
#
# Postprocess scaffold
#
#
# Compatible sed -i.
# https://stackoverflow.com/a/4247319/341137
# arg1: Expression.
# arg2: Filename.
#
sedi()
{
    sed -i.bak "$1" "$2"
    rm -f "$2.bak"
}

#
# Exit with an error message
# $1 the message to display
# $2 an optinal exit code, default is 1
#
function error {
    echo "$1" >&2
    exit "${2:-1}"
}

# Install using composer
[[ $1 = "NO_COMPOSER" ]] || composer install

# Get & run scaffolding scripts from Anax Lite
rsync -a vendor/anax/anax-lite/.anax/scaffold/ .anax/scaffold/anax-lite/
bash .anax/scaffold/anax-lite/postprocess.bash "NO_COMPOSER"

# # Copy default config for controller
# rsync -a vendor/anax/controller/config/ config/

# Copy default config for page
rsync -a vendor/anax/page/config/ config/

# Copy default config for textfilter
rsync -a vendor/anax/textfilter/config/ config/

# Copy default config for view
install -d view
rsync -a vendor/anax/view/config/ config/

# Create directory structure for htdocs
install -d htdocs/img
rsync -a vendor/anax/commons/htdocs/ htdocs/



#
# Review these
#
# Setup cimage
make cimage-update

# # Add default files to make it look oophp-me
# make cimage-config-create
# rsync -a .scaffold/default/ ./
