$ErrorActionPreference   = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'atcli.exe'
$packagename = 'atcli'

$packageArgs = @{
  packageName   = $packagename
  fileType      = 'EXE' #only one of these: exe, msi, msu
  file          = $fileLocation

  softwareName  = 'atcli*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum      = 'FA74C9290436BE87A34C73E3C7B7C6CE783253588D15A6C85504A15AD4705EC9'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = 'FA74C9290436BE87A34C73E3C7B7C6CE783253588D15A6C85504A15AD4705EC9'
  checksumType64= 'sha256' #default is md5, can also be sha1, sha256 or sha512

  # MSI
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
