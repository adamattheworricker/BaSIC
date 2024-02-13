#Collect paths for code location and output files from the user
Write-Host "Please enter the full path where the code is located" -ForegroundColor Yellow
$CodeLocation = Read-Host 
Set-Location $CodeLocation

Write-Host "Please enter the path where you'd like output files to be generated" -ForegroundColor Yellow
$OutputFiles = Read-Host

#Ask user if they'd like to run CLOC against the code
Write-Host "Would you like to run CLOC against the code?" -ForegroundColor Yellow
$RunCLOC = Read-Host "(y/n)"

Switch ($RunCLOC)
    {
    y
        {
        Write-Host "Running CLOC..."
        & 'C:\Program Files\CLOC\cloc-1.84.exe' $CodeLocation | Out-File -FilePath $OutputFiles\CLOC.txt
        }
   n
        {
        Write-Host "Skipping CLOC"
        }
    }


#!Code!

#Creds in Code
Write-Host "Checking for creds in code..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'password=|secret*=|password:|secret*:' -ErrorAction SilentlyContinue | Out-File -FilePath $args\credsincode.txt} -ArgumentList $OutputFiles  
Start-Job -ScriptBlock {Get-ChildItem *credential*.* -Recurse -ErrorAction SilentlyContinue | Out-File -FilePath $args\credentialfile.txt} -ArgumentList $OutputFiles  
Start-Job -ScriptBlock {Get-ChildItem *secret*.* -Recurse -ErrorAction SilentlyContinue | Out-File -FilePath $args\secretsfile.txt} -ArgumentList $OutputFiles  

#BannedSDLFunctions
Write-Host "Checking for banned SDL functions..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'strcpy(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfstrcpy.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'strcat(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfstrcat.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'sprintf(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfsprintf.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'snprintf(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfsnprintf.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'snwprintf(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfsnwprintf.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'vstprintf(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfvstprintf.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'vsntprintf(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfvsntprintf.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'strncpy(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfstrncpy.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'strncat(?!_s)' -ErrorAction SilentlyContinue | Out-File-FilePath $args\sdlbfstrncat.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'strtok(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfstrtok.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'makepath(?!_s)' -ErrorAction SilentlyContinue | Out-File-FilePath $args\sdlbfmakepath.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'splitpath(?!_s)' -ErrorAction SilentlyContinue | Out-File-FilePath $args\sdlbfsplitpath.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'sscanf(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfsscanf.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'snscanf(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfsnscanf.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'itoa(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfitoa.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'itow(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfitow.txt} -ArgumentList $OutputFiles
#Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'gets(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfgets.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'strnlen(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfstrnlen.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'memcpy(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfmemcpy.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'wmemcpy(?!_s)' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfwmemcpy.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'IsBad' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfisbad.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'CharToOem' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfchartooem.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'OemToChar' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfoemtochar.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'ChangeWindowMessageFilter' -ErrorAction SilentlyContinue | Out-File -FilePath $args\sdlbfcwmf.txt} -ArgumentList $OutputFiles

#Unsafe Casting
Write-Host "Checking for unsafe casting..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'reinterpret_cast' -ErrorAction SilentlyContinue | Out-File -FilePath $args\unsafecasting.txt} -ArgumentList $OutputFiles  

#Backdoor to Triage
Write-Host "Checking for backdoor mentions..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'backdoor' -ErrorAction SilentlyContinue | Out-File -FilePath $args\backdoorbypasstotriage.txt} -ArgumentList $OutputFiles  

#Weak Hashing Algorithms
Write-Host "Checking for weak hashing algorithms..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'md5' -ErrorAction SilentlyContinue | Out-File -FilePath $args\useofmd5.txt} -ArgumentList $OutputFiles
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'sha-1' -ErrorAction SilentlyContinue | Out-File -FilePath $args\useofsha1.txt} -ArgumentList $OutputFiles

#Dodgy Comments to Triage
Write-Host "Checking for dodgy code comments..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String '#*fixme|#*hack|#*hax|//*fixme|//*hack|//*hax' -ErrorAction SilentlyContinue | Out-File -FilePath $args\dodgycomments.txt} -ArgumentList $OutputFiles  

#Language Versions to Triage
Write-Host "Checking for language versions..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'FROM python:|image: python:|FROM ruby:|image: ruby:' -ErrorAction SilentlyContinue | Out-File -FilePath $args\langversionstotriage.txt} -ArgumentList $OutputFiles  


#!Databases!

#PostgreSQL Trust Authentication
Write-Host "Checking for PostgreSQL trust authentication..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'POSTGRES_HOST_AUTH_METHOD: trust' -ErrorAction SilentlyContinue | Out-File -FilePath $args\postgrestrustauth.txt} -ArgumentList $OutputFiles  

#DBSSLMode Disabled
Write-Host "Checking for DBSSLMode disabled..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'dbsslmode*disable' -ErrorAction SilentlyContinue | Out-File -FilePath $args\dbsslmodedisabled.txt} -ArgumentList $OutputFiles  

#Elasticsearch SSL Disabled
Write-Host "Checking for Elasticsearch SSL disabled..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'es_enable_http_ssl: false' -ErrorAction SilentlyContinue | Out-File -FilePath $args\elasticsearchsslmodedisabled.txt} -ArgumentList $OutputFiles  

#MySQL & MariaDB Root Passwords
Write-Host "Checking for MySQL & MariaDB root passwords..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'MARIADB_ROOT_PASSWORD=|MYSQL_ROOT_PASSWORD=' -ErrorAction SilentlyContinue | Out-File -FilePath $args\mariadbmysqlrootpasswords.txt} -ArgumentList $OutputFiles  

#Database Versions to Triage
Write-Host "Checking for database versions..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'FROM postgres|image: postgres|PG_VERSION=|FROM redis|image: redis|FROM mongo|image: mongo|FROM mysql|image: mysql|FROM mariadb|image: mariadb|FROM elasticsearch|image: elasticsearch|es_version' -ErrorAction SilentlyContinue | Out-File -FilePath $args\dbversionstotriage.txt} -ArgumentList $OutputFiles  

#Redis Configs to Triage
Write-Host "Checking for Redis configuration files..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem redis.conf -Recurse -ErrorAction SilentlyContinue | Out-File -FilePath $args\redisconffilestotriage.txt} -ArgumentList $OutputFiles  
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'Redis configuration file' -ErrorAction SilentlyContinue | Out-File -FilePath $args\redisconfigtotriage.txt} -ArgumentList $OutputFiles  

#PostgreSQL Configs to Triage
Write-Host "Checking for PostgreSQL configuration files..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem postgresql.conf -Recurse -ErrorAction SilentlyContinue | Out-File -FilePath $args\postgresqltotriage.txt} -ArgumentList $OutputFiles  


#!Hosts!
#Host OS Versions to Triage
Write-Host "Check for host OS versions..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'FROM ubuntu|image: ubuntu|FROM centos|image: centos|FROM debian|image: debian' -ErrorAction SilentlyContinue | Out-File -FilePath $args\osversionstotriage.txt} -ArgumentList $OutputFiles  


#!Containers!

#Dockerfiles to Triage
Write-Host "Checking for Dockerfiles & Docker compose files..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem Dockerfile -Recurse -ErrorAction SilentlyContinue | Out-File -FilePath $args\dockerfilestotriage.txt} -ArgumentList $OutputFiles  
Start-Job -ScriptBlock {Get-ChildItem *docker-compose.* -Recurse -ErrorAction SilentlyContinue | Out-File -FilePath $args\dockercomposefilestotriage.txt} -ArgumentList $OutputFiles  


#!Ports & Protocols!

#Cleartext Ports
Write-Host "Checking for cleartext ports..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String '- 21:21|EXPOSE 21|- 23:23|EXPOSE 23|- 80:80|EXPOSE 80|- 389:389|EXPOSE 389' -ErrorAction SilentlyContinue | Out-File -FilePath $args\cleartextports.txt} -ArgumentList $OutputFiles  

#Cleartext URLs
Write-Host "Checking for cleartext URLs..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'http://|ldap://' -ErrorAction SilentlyContinue | Out-File -FilePath $args\cleartextports.txt} -ArgumentList $OutputFiles  

#SSL Options Disabled
Write-Host "Checking for disabled SSL options" -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'useSSL=false|requireSSL=false|sslmode=disable|use_ssl: false' -ErrorAction SilentlyContinue | Out-File -FilePath $args\ssldisabled.txt} -ArgumentList $OutputFiles  

#Deprecated TLS Versions
Write-Host "Checking for deprecated TLS versions..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'tls*1.0|tls1.0|tls*1.1|tls1.1' -ErrorAction SilentlyContinue | Out-File -FilePath $args\deprecatedtlsversions.txt} -ArgumentList $OutputFiles  

#Ports to Triage
Write-Host "Checking for open ports..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'port [0-9][0-9]|EXPOSE[0-9][0-9]|port=[0-9][0-9]' -ErrorAction SilentlyContinue | Out-File -FilePath $args\portstotriage.txt} -ArgumentList $OutputFiles  

#HSTS to Triage
Write-Host "Checking for HSTS..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'hsts|strict-transport' -ErrorAction SilentlyContinue | Out-File -FilePath $args\hststotriage.txt} -ArgumentList $OutputFiles  


#!DevOpsScripts!

#Salt Message Signing Disabled
Write-Host "Checking for disabled Salt signing..." -ForegroundColor Yellow
Start-Job -ScriptBlock {Get-ChildItem * -Recurse -ErrorAction SilentlyContinue | Select-String 'sign_pub_messages: False|require_minion_sign_messages: False' -ErrorAction SilentlyContinue | Out-File -FilePath $args\saltmessagesigningdisabled.txt} -ArgumentList $OutputFiles  


#Open Output Files in Explorer & Exit
Get-Job | Wait-Job
Write-Host "Complete!" -ForegroundColor Yellow
Invoke-Item $OutputFiles
Exit