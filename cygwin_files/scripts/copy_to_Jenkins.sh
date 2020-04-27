#Moves the file to desktop - written to be called within cygwin.
fileToCopy=$1
scp $1 tfsadm@htappl14.qcorpaa.aa.com:~
