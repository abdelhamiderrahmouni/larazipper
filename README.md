# Zipper
a bash script that can be used to streamline the zipping of projects

## Overview
This script automates the process of creating a zip archive of a project directory, with the ability to exclude specified subdirectories. The script takes the project name as an argument and creates a snake case zip file name.

## Usage
./zipper.sh project_name [-x exclude_paths]
**Arguments**
project_name: The name of the project directory to be zipped.
[-x exclude_paths]: (Optional) A list of paths relative to the project directory that should be excluded from the zip file. Each path should be separated by a space.
**Example**
./zipper.sh myProject -x node_modules storage public/storage
This command will create a zip file named my_project.zip containing the contents of the myProject directory, excluding the node_modules, storage, and public/storage subdirectories.

## Notes
you can make the script executable and alias it to re-use it any where in your system.
The -x flag must be used if you want to exclude any paths. If no -x flag is provided, all paths will be included in the zip file.
Paths are relative to the project directory and should not start with a slash (/).
The script does not check if the paths exist; it will attempt to exclude them as specified.
