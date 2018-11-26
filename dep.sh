#/usr/bin/bash

#BASE_DIR="/home/synerzip/Concishare/Server/concishare-rest-api/test_deploy"
BASE_DIR="/mnt/e/gitmyrepo/myrepo"
LOG_DIR="${BASE_DIR}"/logs
NPM=npm
cd ${BASE_DIR}
#echo "Stopping npm"
#$NPM run stop 

#if PID=$(ps -ef -A |grep "${NPM}")
#then
#    echo "$NPM is Still running, PID is $PID Trying Again ..."
    #$NPM run stop 
#else
#    echo "$NPM is not running"
#fi
#echo "Removing older log folders"
#rm -rf "${LOG_DIR}"

#echo "Pulling Latest code from git"
git pull origin for_bharat
git diff --name-only | grep -E '.env.example'
ret_code=$?
if [ $ret_code == 0 ]; then
    cp ${BASE_DIR}/.env ${BASE_DIR}/.env_bkup
    cp ${BASE_DIR}/.env.example ${BASE_DIR}/.env
#    exit 0
fi
git diff --name-only | grep -E 'package.json'
#ret_code=$?
if [ $ret_code == 0 ]; then
    $NPM install
#    exit 0
fi
echo "Starting npm"
#$NPM run start
