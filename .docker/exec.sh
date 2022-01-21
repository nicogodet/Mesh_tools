#!/usr/bin/env bash

docker exec -t qgis sh -c "cd /tests_directory/mesh_tools && qgis_testrunner.sh"
