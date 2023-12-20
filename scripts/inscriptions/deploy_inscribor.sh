#!/bin/bash

###############################################
# DECLARE THE CONTRACT CLASS                  #
###############################################

# Prepare declare args
COMPILER_VERSION="2.1.0"
CONTRACT_CLASS_FILE="./target/dev/sandbox_Inscribor.contract_class.json"
DECLARE_ARGS="--compiler-version=$COMPILER_VERSION"

# Declare the contract and capture the command output
command_output=$(starkli declare $CONTRACT_CLASS_FILE $DECLARE_ARGS --watch)

from_string="Class hash declared:"
class_hash="${command_output#*$from_string}"

echo "Class hash: $class_hash"

###############################################
# DEPLOY THE CONTRACT                         #
###############################################

# Deploy the contract using the extracted class hash
starkli deploy $class_hash