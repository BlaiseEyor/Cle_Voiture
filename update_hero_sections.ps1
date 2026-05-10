# PowerShell script to update hero sections in all HTML files

$htmlFiles = Get-ChildItem -Path "." -Include "*.html" -Recurse | Where-Object {
    $_.Name -notmatch "^(index|contact|a-propos|zone-intervention)\.html$"
}

$oldHeroPattern = '<div class="absolute inset-0 -z-10 bg-gradient-to-br from-green-600 via-green-600 to-green-600"></div>'
$newHeroPattern = '<div class="absolute top-0 right-0 w-96 h-96 bg-green-600/10 rounded-full blur-3xl -z-10"></div>' + [Environment]::NewLine + '            <div class="absolute bottom-0 left-0 w-72 h-72 bg-green-500/5 rounded-full blur-3xl -z-10"></div>'

$oldBackgroundClass = 'bg-gradient-to-br from-green-600 via-green-600 to-green-600'
$newBackgroundClass = 'bg-gradient-to-b from-slate-900 via-slate-800 to-slate-900'

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Encoding UTF8 -Raw
    $originalLength = $content.Length
    
    $content = $content -replace [regex]::Escape($oldHeroPattern), $newHeroPattern
    $content = $content -replace $oldBackgroundClass, $newBackgroundClass
    
    if ($content.Length -ne $originalLength) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
        Write-Host "Updated: $($file.FullName)"
    }
}

Write-Host "Done!"
