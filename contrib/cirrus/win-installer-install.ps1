# Update service is required for dotnet 3.5 (dep of wix)
Set-Service -Name wuauserv -StartupType "Manual"
#choco install -y wixtoolset mingw golang archiver

$retries=0
while (($LASTEXITCODE -ne 0) -and  ($retries -lt 5)) {
  choco install -y blah
  $retries++
}
if ($LASTEXITCODE -ne 0) {
   throw "Exit code failure = $LASTEXITCODE"
}
