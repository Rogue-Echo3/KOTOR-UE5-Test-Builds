$ErrorActionPreference='Stop'
$ProgressPreference='SilentlyContinue'
function Get-KotorSha($path){$stream=[IO.File]::OpenRead($path);$sha=[Security.Cryptography.SHA256]::Create();try{return ([BitConverter]::ToString($sha.ComputeHash($stream))).Replace('-','').ToLowerInvariant()}finally{$stream.Dispose();$sha.Dispose()}}
function Assert-KotorOrdinaryPath($path){
 $item=Get-Item -LiteralPath $path -Force
 while($null -ne $item){
  if(($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0){throw ('Refusing a linked path: '+$item.FullName)}
  if($item -is [IO.FileInfo]){$item=$item.Directory}else{$item=$item.Parent}
 }
}
function Test-KotorExtraction($zip,$destination){
 Assert-KotorOrdinaryPath $zip
 Assert-KotorOrdinaryPath $destination
 $root=[IO.Path]::GetFullPath($destination).TrimEnd('\')+'\'
 $archive=[IO.Compression.ZipFile]::OpenRead($zip)
 $count=0
 try{foreach($entry in $archive.Entries){
  $target=[IO.Path]::GetFullPath((Join-Path $destination $entry.FullName))
  if(!$target.StartsWith($root,[StringComparison]::OrdinalIgnoreCase)){throw 'Archive entry is outside the game folder.'}
  if(!$entry.Name){continue}
  Assert-KotorOrdinaryPath $target
  $item=Get-Item -LiteralPath $target
  if($item -isnot [IO.FileInfo] -or $item.Length -ne $entry.Length){throw ('Extracted file size mismatch: '+$entry.FullName)}
  $stream=$entry.Open();$sha=[Security.Cryptography.SHA256]::Create()
  try{$expected=([BitConverter]::ToString($sha.ComputeHash($stream))).Replace('-','').ToLowerInvariant()}finally{$stream.Dispose();$sha.Dispose()}
  if((Get-KotorSha $target) -ne $expected){throw ('Extracted file checksum mismatch: '+$entry.FullName)}
  $count++
 }}finally{$archive.Dispose()}
 if($count -lt 1){throw 'The archive has no game files.'}
}
try {
 $version='9790'
 $base=[IO.Path]::GetFullPath($env:KOTOR_BUILD_DOWNLOAD_ROOT)
 $cache=Join-Path $base 'KOTOR-9790-Downloads'
 New-Item -ItemType Directory -Path $cache -Force | Out-Null
 Assert-KotorOrdinaryPath $cache
 Add-Type -AssemblyName System.IO.Compression.FileSystem
 Write-Host 'KOTOR UE5 Windows test build 9790'
 Write-Host 'Downloading the release manifest from GitHub...'
 $manifest=Invoke-RestMethod -Uri 'https://github.com/Rogue-Echo3/KOTOR-UE5-Test-Builds/releases/download/test-9790/build-manifest-9790.json'
 if($manifest.build -ne $version -or $manifest.zip_name -ne 'KOTOR-UE5-Test-9790-Windows.zip' -or $manifest.parts.Count -lt 1 -or $manifest.parts.Count -gt 20){throw 'Unexpected release manifest.'}
 foreach($part in $manifest.parts){
  if([IO.Path]::GetFileName($part.name) -ne $part.name -or $part.name -notmatch '^KOTOR-UE5-Test-9790-Windows\.zip\.\d{3}$' -or $part.url -notlike 'https://github.com/Rogue-Echo3/KOTOR-UE5-Test-Builds/releases/download/test-9790/*'){throw 'Unexpected download filename or location.'}
  $file=Join-Path $cache $part.name
  $valid=(Test-Path -LiteralPath $file) -and (Get-Item -LiteralPath $file).Length -eq $part.bytes
  if($valid){$valid=(Get-KotorSha $file) -eq $part.sha256}
  if(!$valid){
   Write-Host ('Downloading '+$part.name+' ...')
   $temporary=$file+'.partial'
   Invoke-WebRequest -UseBasicParsing -Uri $part.url -OutFile $temporary
   if((Get-Item -LiteralPath $temporary).Length -ne $part.bytes -or (Get-KotorSha $temporary) -ne $part.sha256){throw ('Download checksum failed: '+$part.name)}
   Move-Item -LiteralPath $temporary -Destination $file -Force
  }else{Write-Host ('Already verified: '+$part.name)}
 }
 $zip=Join-Path $cache $manifest.zip_name
 $zipValid=(Test-Path -LiteralPath $zip) -and (Get-Item -LiteralPath $zip).Length -eq $manifest.zip_bytes
 if($zipValid){$zipValid=(Get-KotorSha $zip) -eq $manifest.zip_sha256}
 if(!$zipValid){
  Write-Host 'Assembling the complete ZIP...'
  $output=[IO.File]::Create($zip)
  try{foreach($part in $manifest.parts){$inputFile=[IO.File]::OpenRead((Join-Path $cache $part.name));try{$inputFile.CopyTo($output,4194304)}finally{$inputFile.Dispose()}}}finally{$output.Dispose()}
  Write-Host 'Verifying the complete ZIP...'
  if((Get-KotorSha $zip) -ne $manifest.zip_sha256){throw 'Complete ZIP checksum failed.'}
 }
 $destination=Join-Path $base 'Play-9790'
 $game=Join-Path $destination 'KOTOR-UE5-Test-9790'
 $complete=Join-Path $destination '.extraction-complete-9790.txt'
 if(!(Test-Path -LiteralPath $complete)){
  if(Test-Path -LiteralPath $destination){throw 'Play-9790 already exists without a completed extraction. Put this helper in a new empty folder and run it there; your existing files have not been changed.'}
  Write-Host 'Extracting the game. This may take a few minutes...'
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  [IO.Compression.ZipFile]::ExtractToDirectory($zip,$destination)
  if(!(Test-Path -LiteralPath (Join-Path $game 'Start KOTOR Test.cmd'))){throw 'The extracted game launcher is missing.'}

 }elseif((Get-Content -LiteralPath $complete -Raw) -ne $manifest.zip_sha256){throw 'Existing extraction belongs to a different archive. Use a fresh folder.'}
 Write-Host 'Checking every extracted game file before removing download files...'
 Test-KotorExtraction $zip $destination
 [IO.File]::WriteAllText($complete,$manifest.zip_sha256)
 Write-Host 'Extraction verified. Removing the ZIP and numbered download parts...'
 try{
  $cacheRoot=[IO.Path]::GetFullPath($cache).TrimEnd('\')+'\'
  $cleanup=@($manifest.zip_name)+@($manifest.parts | ForEach-Object {$_.name})
  foreach($name in $cleanup){
   $target=[IO.Path]::GetFullPath((Join-Path $cache $name))
   if([IO.Path]::GetDirectoryName($target)+'\' -ne $cacheRoot){throw 'Download cleanup path is outside its cache.'}
   Assert-KotorOrdinaryPath $target
   if((Get-Item -LiteralPath $target) -isnot [IO.FileInfo]){throw 'Download cleanup requires an ordinary file.'}
  }
  foreach($name in $cleanup){Remove-Item -LiteralPath (Join-Path $cache $name) -Force}
  Write-Host 'Temporary downloads removed. Your game and saves are kept.'
 }catch{Write-Host ('The game is verified, but some temporary downloads could not be removed: '+$_.Exception.Message) -ForegroundColor Yellow}
 Write-Host ''
 Write-Host 'Ready. Double-click Start KOTOR Test.cmd in the folder that opens.'
 Write-Host 'Personal saves and logs will stay inside the game UserData folder.'
 Invoke-Item -LiteralPath $game
 exit 0
}catch{Write-Host ('Download/extraction stopped: '+$_.Exception.Message) -ForegroundColor Red;exit 1}
