#!/bin/bash

CURRENT_DATE=`date +"%Y_%m_%d_%H_%M_%S"`

cucumber --tags @Ready -f pretty -f html --out AmazonTest_$CURRENT_DATE.html 