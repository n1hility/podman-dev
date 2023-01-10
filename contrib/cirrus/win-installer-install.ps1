# Update service is required for dotnet 3.5 (dep of wix)
Set-Service -Name wuauserv -StartupType "Manual"
#choco install -y wixtoolset mingw golang archiver

function retryInstall {
   param($pkg)

   for ($retries=0;; $retries++) {
     choco install -y $pkg
     if ($LASTEXITCODE -eq 0) -or ($retries -gt 4) {
        return
     }
     Start-Sleep -Seconds 6
   }
}
retryInstall blah
if ($LASTEXITCODE -ne 0) {
   throw "Exit code failure = $LASTEXITCODE"
}
