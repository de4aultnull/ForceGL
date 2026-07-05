#!/bin/bash

# Check if running as root exit if not cuz this script must be run with sudo
if [ "$(id -u)"! = "0" ]; then
   echo "This script must be run with sudo"
   exit 1
fi

# def the variables to be added
VARIABLES_TO_ADD="
export MESA_GL_VERSION_OVERRIDE=3.3COMPAT
export MESA_GLSL_VERSION_OVERRIDE=330
export MESA_NO_ERROR=1
export MESA_GLES_VERSION_OVERRIDE=3.1
"

# Backup /etc/environment (Manual step recommended automating it here for completeness)
# Comment the next line if you've already backed up manually
cp /etc/environment /etc/environment.backup #this one

# Append the variables to /etc/environment
echo "$VARIABLES_TO_ADD" | sudo tee -a /etc/environment

# Inform the user of the output
echo "Les variables ont été ajoutées à /etc/environment."
echo "Veuillez noter : Vous devrez peut-être redémarrer votre système ou exécuter source /etc/environment dans chaque shell pour appliquer ces modifications."
