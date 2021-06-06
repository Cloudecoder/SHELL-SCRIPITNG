#!/bin/bash

source components/common.sh
rm -f /tmp/roboshop.log
set-hostname user

NODE_JS "user"

