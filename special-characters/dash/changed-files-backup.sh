#!/bin/bash

# Creates a backup of all the chnaged files in current directory
# during the last 24 hours (tarball)

BACKUP_FILE=backup-$(date +%m-%d-%Y-%s)

# Get backup file name from command argument, else set to default BACKUP_FILE
archive=${1:-$BACKUP_FILE}

#### find
# -print0: use null character as a separator for the list of found files printed to the stdout,
# this is because filenames can contain white spaces and newlines which can cause problems when
# processing them further. 
#### xargs
# -0 corresponds to find's print0 option, to read input separated by null character.
#### tar
# r: append to the archive
# v: verbose
# f: target file (if its '-' instead of a file name, the target will be stdout)
find . -mtime -1 -type f -print0 | xargs -0 tar rvf "$archive.tar"
gzip $archive.tar

echo "Directory $PWD is backed up in archive: $archive.tar.gz."

exit 0
