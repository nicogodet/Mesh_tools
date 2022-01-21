#!/usr/bin/env bash

docker exec -t qgis sh -c "cd /tests_directory/tests/qgis && qgis_testrunner.sh"
