for L in `cat /cygdrive/c/home/dev_streams`;do echo --$L----;ssh -q -l streamsadmin $L "sh rm -rvf /opt/logs/crewconsumer/sequence/*pdc.log";done

