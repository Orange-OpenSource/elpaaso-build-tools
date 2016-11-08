#!/usr/bin/env bash

usage(){
	echo "usage $0 <REPO_NAME> <TRAVIS_BUILD_NUMBER> <BINTRAY_USER> <BINTRAY_PASSWORD>"
	exit 1
}

if [ $# -ne 4 ]
then
	usage
fi

REPO_NAME=$1
TRAVIS_BUILD_NUMBER=$2
BINTRAY_USER=$3
BINTRAY_PASSWORD=$4

JFROG_PROMOTION_URL=http://oss.jfrog.org/api/plugins/build/promote/snapshotsToBintray/$REPO_NAME/${TRAVIS_BUILD_NUMBER}
echo "Promoting build on JFrog to Bintray (Promotion URL: $JFROG_PROMOTION_URL)"
curl -X POST -u ${BINTRAY_USER}:${BINTRAY_PASSWORD} $JFROG_PROMOTION_URL