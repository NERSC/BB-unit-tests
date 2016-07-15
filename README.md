# BB-unit-tests
A suite of unit tests for the Burst Buffer

### Step One
Assumptions: 
* These scripts were built for the Cori burst buffer.
* There are hardcoded filepaths within the job scripts. Most are for the `$SCRATCH` filesystem.
   * To change the paths to your username, run the following command at the root directory of the repository:
      * `find . -type f | xargs sed -i 's/melrom/yourUsername/g'`
* Each of the subdirectories contains a README file. Please refer to the appropriate README for instructions in that particular directory.
* These scripts use files from a directory located at the root directory of the repository. For github purposes, this `files/` directory has been omitted, because it contains files that are too large for version control. The directory on Cori is `/global/cscratch1/sd/melrom/testSuite/files`

The structure of this directory is as follows:

```
total 104962472
-rw-r----- 1 melrom melrom 107373977600 Apr 30 18:37 100GB
-rw-r----- 1 melrom melrom    104857600 Apr 30 18:31 100MB
-rwxr-x--- 1 melrom melrom  11811160065 Apr 30 19:56 11GB
-rw-r----- 1 melrom melrom      2445420 May  3 01:12 2MB
-rw-r----- 1 melrom melrom           23 May  3 05:52 500GB
drwxr-x--- 2 melrom melrom       241664 May  1 19:01 TestDIR
-rwxr-xr-x 1 melrom melrom          628 May  3 05:37 testVid.sh
```
