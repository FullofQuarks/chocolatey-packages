$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.0.5/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.0.5/TheDesk.exe'
$checksum   = '0884a42d0ad73ef5b610468ca11b92387bb5b3c1846818cf4863b7abe93b6fc66798f8d0957f5260bdad9be0503b78c26419f3f78577dfd173bd4e59789f38bc'
$checksum64 =  '0e365e9902e26d9223c1eccf88aae77144a3a0a4500b815559030d36ec1380462400325abc60874269465a58785153207f8bd1f6870d011ad2940ef4a96cdbba'

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
