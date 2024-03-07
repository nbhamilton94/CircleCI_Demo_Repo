echo "Coverting source to metadata format"
#turns the code into a format the metadata api cares about
#then put the converside inside of the deploy_code directory and reads from the force-app folder to do the conversion
sfdx force:source:convert -d deploy_code -r force-app

echo "Deploying code to org"
#do the metadata deploy command, logging in as the DevHub alias, the directory (-d) you want to deploy the code from is the deploy_code/ folder we made up
#How long are you willing to wait? -1 means "as long as it takes". -l is "what tests do you want to run?" We just want to RunLocalTests 
sfdx force:mdapi:deploy -u DevHub -d deploy_code/ -w -1 -l RunLocalTests