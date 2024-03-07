# Authenticate to salesforce
#echo "Authenticating..."
#sfdx force:auth:jwt:grant --clientid $APP_KEY --jwtkeyfile keys/server.key --username $SF_USERNAME --setdefaultdevhubusername -a DevHub

#Create a scratch org
#echo "Creating the Scratch Org..."
#sfdx force:org:create -f config/project-scratch-def.json -a ${CIRCLE_BRANCH} -s

#sfdx force:source:push -u ${CIRCLE_BRANCH}

#echo "Coverting source to metadata format"
#sfdx force:source:convert -d test_code -r force-app

#echo "Deploying code to org"
#sfdx force:mdapi:deploy --checkonly -u DevHub -d test_code/ -w -1 -l RunLocalTests

#Use this if you are concerned with using up your scratch org limits
echo "Deploying source to org"
#This next line basically deploys the source from the github repo (the force-app folder in the github repo), then it logs into our org to deploy our changes
#Using the DevHub Alias, which we set up inside of login_to_org.sh
sfdx force:source:deploy --sourcepath force-app --targetusername DevHub

echo "Testing code in org"
#run tests and output the test results in a directory called test-results in the tap format.
#Again the user the tests is run under is one we authenticated as using the Devhub Alias
sfdx force:apex:test:run --testlevel RunLocalTests --outputdir test-results --resultformat tap --targetusername DevHub