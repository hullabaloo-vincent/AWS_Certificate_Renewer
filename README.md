# AWS Certificate Renewer

Put your keys in a text file called `temp.txt` and make sure it is populated with the following:

Run the batch file as an administrator. If for whatever reason it cannot find the text file, uncomment the following:

```
::set parentDirRAW=%0
::set parentDirNoQuotes=%parentDirRAW:"=%
::set parentDir=%parentDirNoQuotes:AWS_Certificate_Renewer_v1.2.bat=%
```
