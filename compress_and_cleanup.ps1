# Requires 7-Zip installed and available in PATH
$sourcePath = 'D:\elemental_chronicles\public\content'
$backupDir = 'D:\elemental_chronicles\public\backups'

# Create backup directory if it does not exist
if (-not (Test-Path $backupDir)) {
    New-Item -ItemType Directory -Force -Path $backupDir | Out-Null
}

$timestamp = Get-Date -Format 'yyyyMMdd_HHmmss'
$archiveBase = Join-Path $backupDir "content_$timestamp.zip"

# Compress with 7-Zip and split every 500MB
& 7z.exe a -tzip $archiveBase "$sourcePath\*" -v500m

# Remove archives older than 7 days
$limit = (Get-Date).AddDays(-7)
Get-ChildItem -Path $backupDir -Filter '*.zip*' |
    Where-Object { $_.LastWriteTime -lt $limit } |
    Remove-Item

