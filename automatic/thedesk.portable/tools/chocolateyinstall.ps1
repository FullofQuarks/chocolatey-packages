$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.0.1/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.0.1/TheDesk.exe'
$checksum   = '75806953cb2e8fec2a54c36aeb30d8a215bd5a36b4940ec957c0068b3c5172efd2dc5a942ba432ee9eb4f68e1e8dc6f22a4127f236f5baf3b41053d470608cdb'
$checksum64 =  '4d2989e28f9310d47c53a647af24df87e3f93fe232fdec2227e525839374ea7c8f75f9c32afcbb7f61b96ec8eddc0fcd7b24b65d58226cc5c1b8fc40aee203a4'

$packageArgs = @{
  packageName   = $packageName
  url           = $url
  url64bit      = $url64
  checksum      = $checksum
  checksumType  = 'sha512'
  checksum64    = $checksum64
  checksumType64= 'sha512'
  FileFullPath  = "$toolsDir\thedesk.exe"
}

Get-ChocolateyWebFile @packageArgs
