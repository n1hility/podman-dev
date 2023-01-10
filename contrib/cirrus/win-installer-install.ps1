# Update service is required for dotnet 3.5 (dep of wix)
Set-Service -Name wuauserv -StartupType "Manual"
#choco install -y wixtoolset mingw golang archiver

function retryInstall {
   param($pkg)

   for ($retries=0;; $retries++) {
     if ($retries -gt 5) {
        throw "Could not install package $pkg"
     }
     choco install -y $pkg
     if (($LASTEXITCODE -eq 0) {
        return
     }
     Write-Output "Error installing, waiting before retry"
     Start-Sleep -Seconds 6
   }
}
retryInstall blah
retryInstall mingw
