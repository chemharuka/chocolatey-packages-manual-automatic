$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'white' -FileFullPath "$toolsDir\BigByte.exe" -Url 'http://www.donationcoder.com/Software/Skrommel/BigByte/BigByte.exe' -Checksum '1470C2B1A11E1BEB10890A4789CE9D7A34ABDDE170A6E8CB8C308086741B20E8' -ChecksumType 'sha256'