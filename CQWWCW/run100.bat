call ..\WinPath.bat
FOR /L %%A IN (1,1,100) DO (
  ECHO %%A >> restarts.txt
  ..\BasicConnect.exe -c cluster.ini -f filter.ini -l -b yes
)