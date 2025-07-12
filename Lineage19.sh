#!/bin/bash

echo "Build Started"
# Accounts
git config --global user.name "Hiroumuims"
git config --global user.email "miyamuragsmonly@gmail.com"

#linux-x86 remove
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/LineageOS/android.git -b lineage-19.0
echo "========================="
echo "Repo init success Master"
echo "========================="

# Build Sync
/opt/crave/resync.sh
echo "=============================="
echo "Master the Sync is now Success"
echo "=============================="

# Sync Trees
git clone https://github.com/techyminati/android_device_realme_RMX2185.git -b lineage-18.1 device/realme/RMX2185
git clone https://github.com/techyminati/proprietary_vendor_realme_RMX2185.git -b lineage-18.1 vendor/realme/RMX2185
git clone https://github.com/techyminati/android_kernel_realme_karashi.git -b android-10.0 kernel/realme/RMX2185

# Setup the build environment 
. build/envsetup.sh
echo "Success"

# Lunch
lunch lineage_RMX2185-userdebug
echo "============"
echo "Starting....
echo "============"

# Build
brunch RMX2185