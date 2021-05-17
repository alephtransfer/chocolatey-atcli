$ErrorActionPreference   = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'atcli.exe'
$packagename = 'atcli'

$packageArgs = @{
  packageName   = $packagename
  fileType      = 'EXE' #only one of these: exe, msi, msu
  file          = $fileLocation

  softwareName  = 'atcli*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum      = '64571E22AD2BF32B2BEFEFD554A63A58A092D77FA3803DAAFDB2D99F8DB518FF'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = '64571E22AD2BF32B2BEFEFD554A63A58A092D77FA3803DAAFDB2D99F8DB518FF'
  checksumType64= 'sha256' #default is md5, can also be sha1, sha256 or sha512

  # MSI
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
