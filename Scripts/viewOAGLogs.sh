#View the current flight logs and their location
ssh avidetto@cdcjmp "
cd /logs_prod/latullapp410/logs/oagparser/;
pwd; ls -ltr;
cd /logs_prod/latullapp411/logs/oagparser/;
pwd; ls -ltr;
cd /logs_prod/latullapp412/logs/oagparser/;
pwd;ls -ltr;"