# Reset Database Script
param(
    [string]$ServerName = "localhost",
    [string]$DatabaseName = "YourDatabaseName",
    [string]$ScriptPath = ".\scripts"
)

function Reset-Database {
    param(
        [string]$Server,
        [string]$Database,
        [string]$Scripts
    )
    
    try {
        Write-Host "Starting database reset..." -ForegroundColor Cyan
        
        # Drop and recreate database
        Write-Host "Dropping existing database: $Database"
        sqlcmd -S $Server -Q "DROP DATABASE IF EXISTS [$Database];"
        
        Write-Host "Creating new database: $Database"
        sqlcmd -S $Server -Q "CREATE DATABASE [$Database];"
        
        # Execute initialization scripts
        if (Test-Path $Scripts) {
            Get-ChildItem -Path $Scripts -Filter "*.sql" | Sort-Object Name | ForEach-Object {
                Write-Host "Executing: $($_.Name)"
                sqlcmd -S $Server -d $Database -i $_.FullPath
            }
        }
        
        Write-Host "Database reset completed successfully!" -ForegroundColor Green
    }
    catch {
        Write-Host "Error: $_" -ForegroundColor Red
        exit 1
    }
}

Reset-Database -Server $ServerName -Database $DatabaseName -Scripts $ScriptPath
g