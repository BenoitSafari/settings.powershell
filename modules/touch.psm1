Function touch {
    Param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$path
    )
    
    New-Item -Path $path -ItemType File -Force
}
