#This installs the sfdx cli

echo "Installing Salesforce CLI"
sudo npm install -global sfdx-cli
#dependency for testing LWC
sudo npm install -global @salesforce/sfdx-lwc-jest