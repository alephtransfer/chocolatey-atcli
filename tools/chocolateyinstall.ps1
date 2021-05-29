$ErrorActionPreference   = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'atcli.exe'
$packagename = 'atcli'

$packageArgs = @{
  packageName   = $packagename
  fileType      = 'EXE' #only one of these: exe, msi, msu
  file          = $fileLocation

  softwareName  = 'atcli*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum      = '8f2607eb9985bb0344ad6827235601baaf04bbf57dc49c2a12c1819ef6fede7c'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = '8f2607eb9985bb0344ad6827235601baaf04bbf57dc49c2a12c1819ef6fede7c'
  checksumType64= 'sha256' #default is md5, can also be sha1, sha256 or sha512

  # MSI
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
