# AWS Certificate Renewer

Put your keys in a text file called `temp.txt` and populate it with the following:

export AWS_ACCESS_KEY_ID=`<YOUR ID>`

export AWS_SECRET_ACCESS_KEY=`<YOUR ID>`

export AWS_SESSION_TOKEN=`<YOUR ID>`

Run the batch file as an administrator. If for whatever reason it cannot find the text file, uncomment the following:

```
::set parentDirRAW=%0
::set parentDirNoQuotes=%parentDirRAW:"=%
::set parentDir=%parentDirNoQuotes:test.bat=%
```
