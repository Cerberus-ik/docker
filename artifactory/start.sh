#!/bin/bash
service artifactory start
tail -F $JFROG_HOME/artifactory/var/log/console.log