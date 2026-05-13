$ErrorActionPreference = 'SilentlyContinue'
$sourceFile = Join-Path $PSScriptRoot "powershell.txt"
$marker = "git-fast"

try {
    $newContent = Get-Content -Path $sourceFile -Raw -ErrorAction Stop
    
    if (!(Test-Path $PROFILE)) { 
        $null = New-Item -ItemType File -Path $PROFILE -Force 
    }

    $currentProfile = Get-Content -Path $PROFILE -Raw
    $fullBlock = "`n$marker`n$newContent`n$marker"

    if ($currentProfile -like "*$marker*") {
        $pattern = [regex]::Escape($marker) + "(?s).*" + [regex]::Escape($marker)
        $updated = [regex]::Replace($currentProfile, $pattern, $fullBlock)
        $updated | Out-File -FilePath $PROFILE -Encoding utf8
    } else {
        Add-Content -Path $PROFILE -Value $fullBlock -Encoding utf8
    }

    Write-Host "Successfully installed git-fast" -ForegroundColor Green
}
catch {
    Write-Host "An error occured" -ForegroundColor White
}
finally {
    Write-Host "This window is automatically closed in 5 seconds..."
    Start-Sleep -Seconds 5
    Stop-Process -Id $PID
}