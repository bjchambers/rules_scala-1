#!/usr/bin/env bash

set -e

test_scala_version() {
  SCALA_VERSION=$1
  
  SCALA_VERSION_SHAS=''
  SCALA_VERSION_SHAS+='"scala_compiler": "'$2'",'
  SCALA_VERSION_SHAS+='"scala_library": "'$3'",'
  SCALA_VERSION_SHAS+='"scala_reflect": "'$4'"'

  cd "${dir}"/test_version
  
  timestamp=$(date +%s)
  
  NEW_TEST_DIR="test_${SCALA_VERSION}_${timestamp}"
  
  cp -r version_specific_tests_dir/ $NEW_TEST_DIR
  
  sed \
      -e "s/\${scala_version}/$SCALA_VERSION/" \
      -e "s/\${scala_version_shas}/$SCALA_VERSION_SHAS/" \
      WORKSPACE.template >> $NEW_TEST_DIR/WORKSPACE
  
  cd $NEW_TEST_DIR

  bazel test //...
  RESPONSE_CODE=$?
  
  cd ..
  rm -rf $NEW_TEST_DIR

  exit $RESPONSE_CODE

}

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# shellcheck source=./test_runner.sh
. "${dir}"/test_runner.sh
runner=$(get_test_runner "${1:-local}")

$runner test_scala_version "2.11.12" \
    "3e892546b72ab547cb77de4d840bcfd05c853e73390fed7370a8f19acb0735a0" \
    "0b3d6fd42958ee98715ba2ec5fe221f4ca1e694d7c981b0ae0cd68e97baf6dce" \
    "6ba385b450a6311a15c918cf8688b9af9327c6104f0ecbd35933cfcd3095fe04"
$runner test_scala_version "2.12.6" \
    "3023b07cc02f2b0217b2c04f8e636b396130b3a8544a8dfad498a19c3e57a863" \
    "f81d7144f0ce1b8123335b72ba39003c4be2870767aca15dd0888ba3dab65e98" \
    "ffa70d522fc9f9deec14358aa674e6dd75c9dfa39d4668ef15bb52f002ce99fa"
$runner test_scala_version "2.13" \
    "71d3be89400375bb014ec7eb0b367b91a8f7c7c2354c4f2d9efe28f1af8f960c" \
    "bd3b2fa8b922295ccf1537aba1850d455f82003c10484df509d29ff177cc1edc" \
    "aef72378abbc8b05cfdc7144fc0e55904dd87bf46ce2e973ae667dc3ed2fcee8"
