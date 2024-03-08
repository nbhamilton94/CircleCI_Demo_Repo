echo "Installing JDK"
sudo apt update
sudo apt-get install openjdk-11-jdk
echo "Install SFDX Scanner"
#echo -e 'y/n' | 
sudo npm i -g @salesforce/sfdx-scanner
#echo "i am here:"
#pwd
#cd /node_modules/\@salesforce/sfdx-scanner/
#sf plugins link
#echo -e 'y/n' | sfdx plugins:install @salesforce/sfdx-scanner
#sf plugins install @salesforce/sfdx-scanner
echo "Running SFDX Scanner"
#running the scanner on the default folder in the repository (force-app/main/default) place the results in sfdxScannerAnalysis.csv
#declare that violations cause an error (--violations-cause-error), if you don't do this it won't stop your circleci from deploying to production
npx sfdx scanner:run --target "**/default/**" --format "csv" --outfile "sfdxScannerAnalysis.csv" --violations-cause-error