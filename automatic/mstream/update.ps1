import-module au

$releases = 'https://github.com/IrosTheBeggar/mStream/releases'

function global:au_SearchReplace {

    @{
        "$($Latest.PackageName).nuspec" = @{
          "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
      }

}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re  = "mStream-Server-Setup-.*.exe"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = ($url -split '/' | select -last 1 -skip 1) -Replace 'v',''

    $Latest = @{ URL = ("https://github.com" + $url); Version = $version }
    return $Latest
}

update -ChecksumFor 32
